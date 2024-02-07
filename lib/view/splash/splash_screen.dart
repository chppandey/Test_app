// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:demo_app/constants/app_colors.dart';
import 'package:demo_app/constants/icon_path.dart';
import 'package:demo_app/routing/routing_config.dart';
import 'package:demo_app/utils/local_store.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isSeem = false;
  @override
  void initState() {
    getIsSeen();
    super.initState();
    Future<void>.delayed(
      const Duration(seconds: 5),
      () async {
        bool isSeen = await SharedPref().getOnBoardBool() ?? false;
        log("is user send on boarding ${isSeen.toString()}");
        if (isSeen == false) {
          Navigator.popAndPushNamed(context, onboardingScreen);
        } else {
          Navigator.popAndPushNamed(context, baseScreen);
        }
      },
    );
  }

  void getIsSeen() async {
    isSeem = await SharedPref().getOnBoardBool();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              colorBackgroundGradientStart,
              colorBackgroundGradientEnd,
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Image.asset(
          IconPath.spalshIcon,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
