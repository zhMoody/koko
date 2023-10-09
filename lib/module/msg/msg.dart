import "package:flutter/material.dart";

import "fish_icon.dart";

class Msg extends StatefulWidget {
  const Msg({super.key});

  @override
  State<StatefulWidget> createState() => _MsgState();
}

class _MsgState extends State<Msg> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: SizedBox(
            height: 200,
            width: 100,
            child: FishIcon(isSelected: true, iconKind: IconKind.fishPlus)),
      ),
    );
  }
}
