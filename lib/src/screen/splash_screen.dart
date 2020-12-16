import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/src/screen/after_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = "SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    initData().then((value) {
      navigateToHomeScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Center(
        child: Image.asset(
          'images/splash.gif',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }

  Future initData() async {
    await Future.delayed(Duration(seconds: 5));
  }

  void navigateToHomeScreen() {
    //  Navigator.pushNamed(context, AfterSplash.id);
    Get.off(AfterSplash());
  }
}
