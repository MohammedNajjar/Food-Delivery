import 'package:flutter/material.dart';

@immutable
class ClipShadow extends StatelessWidget {
  final List<BoxShadow> boxShadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  const ClipShadow({
    super.key,
    required this.boxShadow,
    required this.clipper,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...boxShadow.map((shadow) {
          return CustomPaint(
            painter: _ClipShadowPainter(
              clipper: clipper,
              shadow: shadow,
            ),
            child: ClipPath(
              clipper: clipper,
              child: child,
            ),
          );
        }).toList(),
        ClipPath(
          clipper: clipper,
          child: child,
        ),
      ],
    );
  }
}

class _ClipShadowPainter extends CustomPainter {
  final BoxShadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowPainter({
    required this.shadow,
    required this.clipper,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
} 