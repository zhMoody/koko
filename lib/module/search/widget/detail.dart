import "package:KoKo/widget/appbar.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class HomeDetail extends StatefulWidget {
  final String imgurl;
  final String id;
  const HomeDetail({super.key, required this.imgurl, required this.id});
  @override
  State<StatefulWidget> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: zhAppBar(
        "",
        leading: const Icon(
          Icons.chevron_left,
          color: Colors.black,
        ),
        leftButtonClick: () {
          Get.back();
        },
      ),
      body: Stack(
        children: [
          Container(
              color: Colors.pink,
              height: MediaQuery.of(context).size.width / 3),
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Hero(
                tag: widget.id,
                child: Image.network(widget.imgurl, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
