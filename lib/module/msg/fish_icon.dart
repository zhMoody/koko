import "package:flutter/cupertino.dart";

import "fish.dart";
import "fish_plus.dart";

enum IconKind { fish, fishPlus }

class FishIcon extends StatefulWidget {
  const FishIcon({super.key, required this.isSelected, required this.iconKind});
  final bool isSelected;
  final IconKind iconKind;

  @override
  State<FishIcon> createState() => _FishIconState();
}

class _FishIconState extends State<FishIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController progress;

  @override
  void initState() {
    super.initState();
    progress = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    progress.dispose();
    super.dispose();
  }

  painter(IconKind iconKind) => switch (iconKind) {
        IconKind.fish =>
          Fish(progress: progress, isSelected: widget.isSelected),
        IconKind.fishPlus =>
          FishPlus(progress: progress, isSelected: widget.isSelected),
      };

  @override
  Widget build(BuildContext context) {
    // if (widget.isSelected) {
    //   progress.reset();
    //   progress.forward();
    // }
    return Column(
      children: [
        CustomPaint(
          size: const Size(200, 200),
          painter: painter(widget.iconKind),
        ),
      ],
    );
  }
}
