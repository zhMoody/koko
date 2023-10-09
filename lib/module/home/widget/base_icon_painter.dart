import "dart:ui" as ui;

import "package:flutter/material.dart";

abstract class BaseIconPainter extends CustomPainter {
  const BaseIconPainter({required this.progress, required this.isSelected})
      : super(repaint: progress);
  final Animation<double> progress;
  final bool isSelected;

  Color get changedColor => isSelected ? Colors.purple : Colors.grey;

  Color get defaultColor => Colors.grey;

  Paint clearShader(Paint paint) => paint..shader = null;

  Shader? get linearColor => isSelected
      ? ui.Gradient.linear(
          Offset.zero,
          const Offset(40, 40),
          [
            const Color(0xff887dfd),
            const Color(0xff887dfd),
            const Color(0xff00eeb5),
            const Color(0xff33f5ff),
            const Color(0xff887dfd),
            const Color(0xff887dfd),
            const Color(0xff887dfd),
          ],
          [
            1.0 / 7,
            2.0 / 7,
            3.0 / 7,
            4.0 / 7,
            5.0 / 7,
            6.0 / 7,
            1.0,
          ],
          TileMode.mirror,
        )
      : null;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      (oldDelegate as BaseIconPainter).isSelected != isSelected;
}
