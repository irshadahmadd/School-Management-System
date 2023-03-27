import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:school_managment_system/Core/Constants/constants.dart';
import 'package:school_managment_system/Core/Utilities/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);
    Service();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width / 1,
        height: MediaQuery.of(context).size.height / 1,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/schoolbg.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: DefaultTextStyle(
            style: const TextStyle(
                fontSize: 100.0,
                fontFamily: 'Roboto',
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(5.0, 5.0),
                    blurRadius: 0.5,
                    color: Constants.purpleDark,
                  ),
                  Shadow(
                    offset: Offset(5.0, 5.0),
                    blurRadius: 0.5,
                    color: Constants.purpleDark,
                  ),
                ],
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('School Management \nSystem',
                    textAlign: TextAlign.center),
              ],
              onTap: () {
                // print("Tap Event");
              },
            ),
          ),
        ),
      ),
    );
  }
}
