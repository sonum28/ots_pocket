import 'package:flutter/material.dart';
import 'package:ots_pocket/home_screen.dart';
import 'package:ots_pocket/login_screen.dart';
import 'package:ots_pocket/main.dart';
import 'package:ots_pocket/on_boarding_screen.dart';
import 'package:ots_pocket/widget_util/image_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? isOnBoardingScreenLaunch;
  String? token;

  @override
  void initState() {
    _navigationToLoginScreen();
    super.initState();
  }

  _navigationToLoginScreen() async {
    isOnBoardingScreenLaunch =
        await appStorage?.retrieveEncryptedData('isOnBoardingScreenLaunch');
    token = await appStorage?.retrieveEncryptedData('token');

    (isOnBoardingScreenLaunch == "YES")
        ? (token != null)
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()))
            : Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()))
        : Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.hardLight),
              image: AssetImage("asset/images/background_image.jpeg"),
              fit: BoxFit.fill),
        ),
        child: Center(
            child: ImageUtil(
              width: 200.0,
              height: 160.0,
              path: "asset/images/clientlogo.png",
            ),),
      ),
    );
  }
}
