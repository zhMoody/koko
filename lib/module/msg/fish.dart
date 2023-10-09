import "package:flutter/material.dart";

import "../home/widget/base_icon_painter.dart";

class Fish extends BaseIconPainter {
  const Fish({required super.progress, required super.isSelected});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    path.moveTo(0, 20);
    path.cubicTo(0, 15, 10, 0, 20, 0);
    path.cubicTo(30, 0, 40, 10, 40, 20);
    path.cubicTo(40, 30, 30, 40, 20, 40);
    path.cubicTo(10, 40, 0, 25, 0, 20);

    path.moveTo(20, 0);
    path.lineTo(20, 40);

    path.moveTo(30, 10);
    path.lineTo(50, 0);
    path.moveTo(50, 0);
    path.lineTo(45, 20);
    path.moveTo(45, 20);
    path.lineTo(50, 40);
    path.moveTo(50, 40);
    path.lineTo(30, 30);

    canvas.drawPath(path, paint2);
    canvas.drawCircle(const Offset(10, 20), 2, paint2);

    final pms = path.computeMetrics();

    for (final pm in pms) {
      // print(progress.value);
      paint2.style = PaintingStyle.stroke;
      canvas.drawPath(
        pm.extractPath(
          0,
          pm.length * progress.value,
        ),
        paint2..shader = linearColor,
      );
    }

    if (progress.value == 1.0) {
      canvas.drawPath(path, clearShader(paint2..color = changedColor));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
