import 'package:flutter/material.dart';
import 'package:ots_pocket/config/shared_preferences_helper.dart';
import 'package:ots_pocket/login_screen.dart';
import 'package:ots_pocket/on_boarding_screen.dart';
import 'package:ots_pocket/splash_screen.dart';
import 'package:ots_pocket/widget_util/image_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? isOnBoardingScreenLaunch;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  isOnBoardingScreenLaunch = await preferences.getBool('isOnBoardingScreenLaunch');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTS Pocket',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (isOnBoardingScreenLaunch ?? false) ? LoginScreen() : OnBoardingScreen() //const LoginScreen(),
    );
  }
}
