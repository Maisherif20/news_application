import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_application/ui/home.dart';

class SplashScreen  extends StatefulWidget {
  static String routeName = "Splash Screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () { Navigator.pushReplacementNamed(context, HomeScreen.routeName);});
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
        ),
        Image.asset("assests/image/img.png" , fit: BoxFit.fill, width: double.infinity ,height: double.infinity,),
        Center(child: Image.asset("assests/image/img_1.png")),
      ],
    );
  }
}
