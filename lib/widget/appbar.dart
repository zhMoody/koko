import "package:flutter/material.dart";

typedef VoidCallback = Function();
typedef NavRightType = Function();
AppBar zhAppBar(
  String title, {
  List<Widget>? rightTitle,
  Widget? leading,
  VoidCallback? rightButtonClick,
  VoidCallback? leftButtonClick,
  NavRightType? navRightType,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    titleSpacing: 0,
    elevation: 0.1,
    shadowColor: Colors.white,
    leading: GestureDetector(
      onTap: leftButtonClick,
      child: leading ?? const Icon(Icons.menu, color: Colors.black),
    ),
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
