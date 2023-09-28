import "package:flutter/material.dart";
import "package:koko/utils/widget/appbar.dart";
import "package:koko/widget/bg_btn.dart";
import "package:lottie/lottie.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController loveController;
  @override
  void initState() {
    super.initState();
    loveController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: zhAppBar("Get"),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Lottie.asset(
                "assets/animation_icon/love.json",
                controller: loveController,
              ),
            ),
          ),
          BgBtn("播放", onClick: () {
            loveController.reset();
            loveController.forward();
          })
        ],
      ),
    );
  }
}
