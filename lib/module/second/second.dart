import "package:flutter/material.dart";

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<StatefulWidget> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.pink,
      ),
    );
  }
}
