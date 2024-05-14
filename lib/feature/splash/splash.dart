import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kids_chore_app/core/routes/routes_config.dart';
import 'package:kids_chore_app/feature/home/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(seconds: 2),
        () => context.push(
              RoutesConfig.landing,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 237, 213, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/kids.png'),
            const Text(
              'Kids Chores',
              style: TextStyle(fontSize: 48),
            ),
            const Text(
              'Bringing Family Closer',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
