import 'dart:async';

import 'package:flutter/material.dart';
import 'package:school_app/core/utils/assets_manager.dart';
import 'package:school_app/routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(
          context,
          AppRoutesNames.welcomeView, //
        );
      },
      //
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image(
            image: AssetImage(AssetsManager.logo), //
          ), //
        ),
      ),
    );
  }
}
