import 'package:auto_route/auto_route.dart';
import 'package:example/core/index.dart';
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
      AutoRouter.of(context).push(const LoginRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Icon(Icons.holiday_village, size: 100)),
    );
  }
}
