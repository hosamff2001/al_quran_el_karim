import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../core/resources/constants_manager.dart';
import '../../../core/utliz/routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await AppConstants.readJson();
      await AppConstants.getSettings();
    });
    Timer(const Duration(seconds: AppConstants.splashDelay), () {
      GoRouter.of(context).pushReplacement(MyRoute.kHomeView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: Lottie.asset("asset/animation/splash.json")),
        ),
      ),
    );
  }
}
