import "package:flutter/material.dart";
import "package:koko/utils/widget/appbar.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: zhAppBar("Get"),
      body: Container(width: 100, height: 100, color: Colors.teal),
    );
  }
}
