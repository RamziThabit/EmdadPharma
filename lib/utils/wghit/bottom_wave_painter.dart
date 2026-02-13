import 'package:flutter/material.dart';


class BottomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xff2563EB);

    Path path = Path();
    path.moveTo(0, 40);
    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      60,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
