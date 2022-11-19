import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ots_pocket/bloc/branch/branch_bloc.dart';
import 'package:ots_pocket/bloc/login/login_bloc.dart';
import 'package:ots_pocket/bloc/user/get_user_details/get_user_details_bloc.dart';
import 'package:ots_pocket/bloc/user/registration/registration_bloc.dart';
import 'package:ots_pocket/config/stroage.dart';
import 'package:ots_pocket/config/repo_factory.dart';
import 'package:ots_pocket/splash_screen.dart';

final EncryptedSharedPrefManager? appStorage =
    EncryptedSharedPrefManager.getInstance();

void main() async {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BranchBloc(
            repoFactory: RepoFactory(),
          ),
        ),
        BlocProvider(
          create: (context) => UserRegistrationBloc(
            repoFactory: RepoFactory(),
          ),
        ),
        BlocProvider(
          create: (context) => LoginBloc(
            repoFactory: RepoFactory(),
          ),
        ),
        BlocProvider(
          create: (context) => GetUserDetailsUserBloc(
            repoFactory: RepoFactory(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OTS Pocket',
      theme: ThemeData(
        primaryColor: Color(0xFF157B4F),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
