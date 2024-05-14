import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kids_chore_app/core/routes/routes_config.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2),
        () => context.pushReplacement(RoutesConfig.home));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text('Welcome to the Splash Screen!'),
      ),
    );
  }
}
