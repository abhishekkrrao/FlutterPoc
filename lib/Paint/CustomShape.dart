import 'package:flutter/material.dart';

class CustomShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    canvas.drawArc(Rect.fromLTRB(20,30,25,40), 50,50,true, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

  }

}
