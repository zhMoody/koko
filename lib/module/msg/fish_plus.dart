import "dart:math";
import "dart:ui" as ui;

import "package:flutter/material.dart";

import "../home/widget/base_icon_painter.dart";

class FishPlus extends BaseIconPainter {
  FishPlus({required super.progress, required super.isSelected});
  final Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    path.moveTo(0, 20);
    path.cubicTo(0, 13, 10, 0, 20, 0);
    path.cubicTo(30, 0, 40, 10, 40, 20);
    path.cubicTo(40, 30, 30, 40, 20, 40);
    path.cubicTo(10, 40, 0, 28, 0, 20);

    path.moveTo(18, 0);
    path.lineTo(18, 40);

    path.moveTo(38, 10);
    path.lineTo(55, 5);
    path.relativeLineTo(-5, 15);
    path.relativeLineTo(5, 15);
    path.relativeLineTo(-17, -5);

    final rect =
        Rect.fromCenter(center: const Offset(9, 20), width: 2, height: 2);
    path.arcTo(rect, 0, pi * 1.99, true);

    canvas.drawPath(
        path,
        paint
          ..color = defaultColor
          ..strokeJoin = StrokeJoin.round);

    final pms = path.computeMetrics();

    for (final pm in pms) {
      // print(progress.value);
      paint.style = PaintingStyle.stroke;
      paint.strokeJoin = StrokeJoin.round;
      canvas.drawPath(
        pm.extractPath(
          0,
          pm.length * progress.value,
        ),
        paint..shader = linearColor,
      );
    }

    if (progress.value == 1.0) {
      canvas.drawPath(path, clearShader(paint..color = changedColor));
    }
  }

  //绘制头
  void _drawHead(Canvas canvas, Size size) {
    var rect =
        Rect.fromCenter(center: const Offset(0, 100), height: 80, width: 80);
    var a = progress.value * 15 / 180 * pi;
    canvas.drawArc(
        rect, a, 2 * pi - a.abs() * 2, true, _paint..color = Colors.blue);
  }

  //绘制眼睛
  void _drawEye(Canvas canvas, double radius) {
    canvas.drawCircle(Offset(radius * 0.15, -radius * 0.6 + 100), radius * 0.12,
        _paint..color = Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
