import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/core/utils/image_constant.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          ImageConstants.splashLogo2,
          height: MediaQuery.of(context).size.height * 0.3,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  void navigate() {
    Timer(const Duration(seconds: 3), () {
      context.go(RouteName.dashboard);
    });
  }
}
