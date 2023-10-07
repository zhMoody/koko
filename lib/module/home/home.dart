import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:koko/api/json_to_dart/mock_data.dart";
import "package:koko/util/extension.dart";

import "../../api/mock_dao.dart";
import "../../main.dart";
import "../../util/net/net_adapter.dart";

class Home extends StatefulWidget {
  final MyDrawerController drawerController;
  const Home({super.key, required this.drawerController});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController loveController;
  late ScrollController scrollController;

  late MockData mockData = MockData.init();
  Future<NetResponse<Map<String, dynamic>>> getMockData() async {
    return await MockDao.mockGetData();
  }

  @override
  void initState() {
    loveController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..addListener(() {
        setState(() {});
      });
    scrollController = ScrollController();
    getMockData().then((res) {
      print(res);
      setState(() {
        mockData = MockData.fromJson(res.data!);
      });
    });
    super.initState();
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
              mockData.list.mapi((e, i) {
                return ListTile(
                  onTap: () {
                    print(e.id);
                  },
                  title: Text(e.title),
                  subtitle: Text(e.subTitle),
                  trailing: const Icon(Icons.chevron_right),
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(48)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(48)),
                      child: Image.network(e.imgSrc, fit: BoxFit.cover),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
