import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class TestHelper {
  static Future<void> loadImages(WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    
    // Create a test image that can be used in place of network or asset images
    final testImage = await createTestImage(width: 100, height: 100);
    
    // Create a custom asset bundle
    final testBundle = TestAssetBundle();
    testBundle.addAsset('assets/images/virtual/splash_icon.png', testImage);
    testBundle.addAsset('assets/images/virtual/landing_background.png', testImage);
    testBundle.addAsset('assets/images/virtual/login_background.png', testImage);
    
    // Set up asset bundle
    final Map<String, List<String>> manifest = {
      'assets/images/virtual/splash_icon.png': ['assets/images/virtual/splash_icon.png'],
      'assets/images/virtual/landing_background.png': ['assets/images/virtual/landing_background.png'],
      'assets/images/virtual/login_background.png': ['assets/images/virtual/login_background.png'],
    };
    
    final encodedManifest = ByteData.sublistView(
      Uint8List.fromList(utf8.encode(json.encode(manifest))),
    );

    // Mock the asset bundle
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMessageHandler(
      'flutter/assets',
      (ByteData? message) async {
        if (message != null) {
          final methodCall = const StandardMethodCodec().decodeMethodCall(message);
          if (methodCall.method == 'getAsset' && methodCall.arguments == 'AssetManifest.json') {
            return encodedManifest;
          }
          if (methodCall.method == 'loadAsset') {
            return testImage;
          }
        }
        return null;
      },
    );
  }

  static Future<ByteData> createTestImage({
    required int width,
    required int height,
    Color color = Colors.blue,
  }) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint()..color = color;
    
    // Draw a gradient background
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [color, color.withOpacity(0.7)],
    );
    
    canvas.drawRect(
      Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
      Paint()..shader = gradient.createShader(
        Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
      ),
    );
    
    final picture = recorder.endRecording();
    final image = await picture.toImage(width, height);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!;
  }

  /// Helper method to pump widgets with a delay
  static Future<void> pumpWithDelay(WidgetTester tester, [Duration delay = const Duration(milliseconds: 100)]) async {
    await tester.pump();
    await tester.pump(delay);
    await tester.pumpAndSettle();
  }
}

class TestAssetBundle extends AssetBundle {
  final Map<String, ByteData> _assets = {};

  void addAsset(String key, ByteData asset) {
    _assets[key] = asset;
  }

  @override
  Future<ByteData> load(String key) async {
    if (!_assets.containsKey(key)) {
      throw FlutterError('Asset $key not found');
    }
    return _assets[key]!;
  }

  @override
  Future<T> loadStructuredData<T>(String key, Future<T> Function(String value) parser) async {
    final data = await load(key);
    return parser(utf8.decode(data.buffer.asUint8List()));
  }
} 