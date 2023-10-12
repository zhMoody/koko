import "package:KoKo/widget/splash_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_zoom_drawer/flutter_zoom_drawer.dart";
import "package:get/get.dart";

import "module/index.dart";

void main() {
  Get.put<MyDrawerController>(MyDrawerController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "KoKo",
      defaultTransition: Transition.fade,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(
        splashScreenState: SplashScreenState.usingGradient,
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends GetView<MyDrawerController> {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(
        style: DrawerStyle.defaultStyle,
        controller: _.zoomDrawerController,
        menuScreen: const MenuScreen(),
        mainScreen: const MainScreen(),
        borderRadius: 20.0,
        showShadow: true,
        angle: 0.0,
        menuBackgroundColor: Colors.white,
        // menuBackgroundColor: const Color(0xfffdfdf8),
        drawerShadowsBackgroundColor: const Color(0x29f1f1f1),
        slideWidth: MediaQuery.of(context).size.width * 0.75,
      ),
    );
  }
}

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [Color(0xffFF6B6B), Colors.white],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 0),
                      blurRadius: 6,
                      spreadRadius: 1,
                    )
                  ]),
              child: const Center(
                child: Icon(
                  Icons.people,
                  color: Colors.cyan,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Moody",
              style: TextStyle(
                color: Colors.black.withAlpha(450),
                fontSize: 25,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends GetView<MyDrawerController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff1f1f1),
      child: Index(drawerController: controller),
    );
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }
}
