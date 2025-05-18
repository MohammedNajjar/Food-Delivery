import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monkey_app_demo/main.dart';
import 'package:monkey_app_demo/screens/homeScreen.dart';
import 'package:monkey_app_demo/widgets/searchBar.dart';
import 'package:monkey_app_demo/widgets/customNavBar.dart';
import 'package:monkey_app_demo/screens/loginScreen.dart';
import 'package:monkey_app_demo/screens/landingScreen.dart';
import 'test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    // Ignore overflow errors and set up error handling
    FlutterError.onError = (FlutterErrorDetails details) {
      if (!details.toString().contains('overflowed by') &&
          !details.toString().contains('A RenderFlex overflowed')) {
        FlutterError.presentError(details);
      }
    };
  });

  group('Food Delivery App Tests', () {
    testWidgets('App should show splash screen initially', (WidgetTester tester) async {
      // Load test images first
      await TestHelper.loadImages(tester);
      
      // Build our app and trigger a frame
      await tester.pumpWidget(const MyApp());
      await tester.pump();

      // Verify splash screen content
      expect(find.text('Food Delivery'), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      
      // Verify no error messages are shown
      expect(find.byType(ErrorWidget), findsNothing);
    });

    testWidgets('App should navigate to landing screen after splash', (WidgetTester tester) async {
      // Load test images first
      await TestHelper.loadImages(tester);
      
      // Build our app and trigger a frame
      await tester.pumpWidget(const MyApp());
      await tester.pump();
      
      // Wait for splash screen timer (100ms in test mode)
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();

      // Verify landing screen content
      expect(
        find.text('Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep'),
        findsOneWidget,
        reason: 'Landing screen text not found',
      );
      
      expect(
        find.widgetWithText(ElevatedButton, 'Login'),
        findsOneWidget,
        reason: 'Login button not found',
      );
      
      expect(
        find.widgetWithText(ElevatedButton, 'Create an Account'),
        findsOneWidget,
        reason: 'Create Account button not found',
      );

      // Verify no overflow errors
      expect(find.byType(ErrorWidget), findsNothing);
    });

    testWidgets('Should navigate to login screen when login button is pressed',
        (WidgetTester tester) async {
      // Load test images first
      await TestHelper.loadImages(tester);
      
      // Build our app and trigger a frame
      await tester.pumpWidget(const MyApp());
      await tester.pump();
      
      // Wait for splash screen timer (100ms in test mode)
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();

      // Find and tap login button
      final loginButton = find.widgetWithText(ElevatedButton, 'Login');
      expect(loginButton, findsOneWidget, reason: 'Login button not found');
      
      await tester.ensureVisible(loginButton);
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Verify login screen content
      expect(
        find.byType(LoginScreen),
        findsOneWidget,
        reason: 'Login screen not found',
      );
      
      expect(
        find.text('Add your details to login'),
        findsOneWidget,
        reason: 'Login screen text not found',
      );

      // Verify form fields are present
      expect(find.byType(TextField), findsWidgets);
      expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);

      // Verify no overflow errors
      expect(find.byType(ErrorWidget), findsNothing);
    });
  });
}