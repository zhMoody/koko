import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

typedef ClickCallBack = void Function();

class BgBtn extends StatefulWidget {
  final String bgurl;
  final ClickCallBack onClick;
  final String text;
  const BgBtn(
    this.text, {
    super.key,
    this.bgurl = "assets/animation_icon/btnbg.json",
    required this.onClick,
  });
  @override
  State<StatefulWidget> createState() {
    return _BgBtnState();
  }
}

class _BgBtnState extends State<BgBtn> with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Lottie.asset(
            widget.bgurl,
            controller: _controller,
          ),
          TextButton(
              onPressed: () {
                _controller.reset();
                _controller.forward();
                widget.onClick();
              },
              child: Text(widget.text)),
        ],
      ),
    );
  }
}
