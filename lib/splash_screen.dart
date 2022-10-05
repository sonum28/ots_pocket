import 'package:flutter/material.dart';
import 'package:ots_pocket/config/shared_preferences_helper.dart';
import 'package:ots_pocket/login_screen.dart';
import 'package:ots_pocket/on_boarding_screen.dart';
import 'package:ots_pocket/widget_util/image_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigationToLoginScreen();
  }

  _navigationToLoginScreen() async {
    await Future.delayed(const Duration(seconds: 5), () {});

    final preferences = await SharedPreferences.getInstance();
    bool? boolValuesSP  = preferences.getBool('isOnBoardingScreenLaunch');

    if(boolValuesSP ?? false) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const OnBoardingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: ImageUtil(
        width: 200.0,
        height: 160.0,
        path: "asset/images/splash_screen_image.png",
      )),
    );
  }
}
