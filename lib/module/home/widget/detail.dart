import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:koko/widget/appbar.dart";

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
      body: Hero(
        tag: widget.id,
        child: Image.network(widget.imgurl),
      ),
    );
  }
}
