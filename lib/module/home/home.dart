import "package:fijkplayer/fijkplayer.dart";
import "package:flutter/material.dart";
import "package:koko/widget/bg_btn.dart";
import "package:koko/widget/player_skin.dart";
import "package:lottie/lottie.dart";

import "../../main.dart";

class Home extends StatefulWidget {
  final MyDrawerController drawerController;
  const Home({super.key, required this.drawerController});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController loveController;
  final player = FijkPlayer();
  final url = "";
  // "http://v16m-default.akamaized.net/c808dc650e1c629aa59cb6c648cb37db/651ac7ba/video/tos/alisg/tos-alisg-ve-0051c001-sg/ogFY1r0DULNtSRngbB8lAOBngcQe9B7fbgFDyE/?a=2011&ch=0&cr=0&dr=0&net=5&cd=0%7C0%7C0%7C0&br=3462&bt=1731&bti=MzhALjBg&cs=0&ds=4&ft=iJOG.y7oZZv0PD1YhI.xg9wz.DKlBEeC~&mime_type=video_mp4&qs=0&rc=OWU3OjQ8N2ZoNDpmZjs6PEBpajRnZjQ6ZmczbjMzODYzNEAzYF8zMWFfNWAxLTEtNTIvYSNfbWsycjRfbl9gLS1kMC1zcw%3D%3D&l=2023100207140612C83BBBF69D6C11D0B2&btag=e000a8000";

  @override
  void initState() {
    super.initState();
    loveController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..addListener(() {
        setState(() {});
      });
    player.setDataSource(url, autoPlay: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 5,
        backgroundColor: Colors.black,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
          FijkView(
              height: 235,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              player: player,
              panelBuilder: (FijkPlayer player, FijkData data,
                  BuildContext context, Size viewSize, Rect texturePos) {
                return PlayerSkin(
                  player: player,
                  buildCtx: context,
                  viewSize: viewSize,
                  texturePos: texturePos,
                );
              }),
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
          Wrap(
            children: [
              BgBtn("播放", onClick: () {
                // loveController.reset();
                // loveController.forward();
                player.start();
              }),
              BgBtn("暂停", onClick: () {
                // loveController.reset();
                // loveController.forward();
                player.pause();
              }),
            ],
          )
        ],
      ),
    );
  }
}
