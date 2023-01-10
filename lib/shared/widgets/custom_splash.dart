import 'dart:async';
import 'package:e_commerce/modules/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "Assets.images.background.path",
            fit: BoxFit.fill,
          ),
          Center(
            child:Image.asset('Assets.images.splashLogo.path',
              height: 157.0,
              width: 160.0,
            ),
          )
        ],
      ),
    );
  }
}