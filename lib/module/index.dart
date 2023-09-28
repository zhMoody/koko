import "package:flutter/material.dart";

import "../utils/zh_animated_bottom_bar.dart";
import "home/home.dart";
import "second/second.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title});

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;

  Color backgroundColor = const Color(0xffffffff);
  late PageController _pageController;

  List<String> titles = ["Get", "Search", "Msg", "User"];
  List<Widget> navigationList = [
    const Home(),
    const Second(),
    const Second(),
    const Second(),
  ];
  @override
  void initState() {
    _pageController = PageController(keepPage: true, initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: navigationList),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return ZhAnimatedBottomBar(
      containerHeight: 56,
      backgroundColor: backgroundColor,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeInOut,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <MyBottomNavigationBarItem>[
        MyBottomNavigationBarItem(
          icon: const Icon(Icons.home),
          title: Text(titles[0]),
          activeColor: const Color(0xffF4D144),
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        MyBottomNavigationBarItem(
          icon: const Icon(Icons.search),
          title: Text(titles[1]),
          activeColor: Colors.greenAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        MyBottomNavigationBarItem(
          icon: const Icon(Icons.message),
          title: Text(
            titles[2],
          ),
          activeColor: Colors.pink,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        MyBottomNavigationBarItem(
          icon: const Icon(Icons.people),
          title: Text(titles[3]),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
