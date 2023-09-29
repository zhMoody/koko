import "package:flutter/material.dart";

class Msg extends StatefulWidget {
  const Msg({super.key});

  @override
  State<StatefulWidget> createState() => _MsgState();
}

class _MsgState extends State<Msg> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.cyan,
        ),
      ),
    );
  }
}
