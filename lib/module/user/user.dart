import "package:flutter/material.dart";

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<StatefulWidget> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.pink,
        ),
      ),
    );
  }
}
