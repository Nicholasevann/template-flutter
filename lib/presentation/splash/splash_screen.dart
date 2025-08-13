import 'package:auto_route/auto_route.dart';
import 'package:boneconsulting/core/index.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed((const Duration(seconds: 2)), () {
      AutoRouter.of(context).push(const OnboardingRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Center(
        child: Image.asset(
          'assets/icon/logo-splash.png',
          width: 180,
          height: 180,
        ),
      ),
    );
  }
}
