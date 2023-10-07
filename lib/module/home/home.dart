import "package:fijkplayer/fijkplayer.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
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
  late ScrollController scrollController;

  final player = FijkPlayer();
  final url = "";

  get curve => null;
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
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // FijkView(
          //     height: 235,
          //     width: MediaQuery.of(context).size.width,
          //     color: Colors.black,
          //     player: player,
          //     panelBuilder: (FijkPlayer player, FijkData data,
          //         BuildContext context, Size viewSize, Rect texturePos) {
          //       return PlayerSkin(
          //         player: player,
          //         buildCtx: context,
          //         viewSize: viewSize,
          //         texturePos: texturePos,
          //       );
          //     }),
          CupertinoSliverNavigationBar(
            trailing: const Icon(Icons.share, size: 25),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19000000),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        spreadRadius: 1,
                      )
                    ]),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Image.network(
                    "https://book.flutterchina.club/assets/img/logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            largeTitle: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.ac_unit),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("xxxx")),
                Icon(Icons.ac_unit),
              ],
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 70,
            delegate: SliverChildListDelegate(
              () {
                List<Widget> list = [];
                for (var i = 0; i < 60; i++) {
                  var widg = ListTile(
                    onTap: () {
                      print(i);
                    },
                    title: Text("$i - XXXXXXXXXX"),
                    subtitle: Text("$i - 000000000"),
                    trailing: const Icon(Icons.chevron_right),
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(Radius.circular(48)),
                      ),
                      child: Center(
                        child: Text("${i + 1}",
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  );
                  list.add(widg);
                }
                return list;
              }(),
            ),
          ),
        ],
      ),
    );
  }
}
