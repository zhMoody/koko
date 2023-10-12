import "package:flutter/material.dart";

import "../../main.dart";

class Home extends StatefulWidget {
  final MyDrawerController drawerController;
  const Home({super.key, required this.drawerController});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
