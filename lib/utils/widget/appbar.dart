import "package:flutter/material.dart";

typedef VoidCallback = Function();
typedef NavRightType = Function();
AppBar zhAppBar(
  String title, {
  List<Widget>? rightTitle,
  Widget? leading,
  VoidCallback? rightButtonClick,
  NavRightType? navRightType,
}) {
  return AppBar(
    centerTitle: false,
    backgroundColor: Colors.white,
    titleSpacing: 0,
    elevation: 0.1,
    shadowColor: Colors.white,
    leading: leading ?? const Icon(Icons.balcony, color: Colors.black),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: rightTitle,
  );
}
