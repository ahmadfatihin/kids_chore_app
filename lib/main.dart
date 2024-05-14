import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kids_chore_app/core/di/injector.dart';
import 'package:kids_chore_app/core/routes/routes_config.dart';
import 'package:kids_chore_app/feature/splash/splash.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('com.wolkk.kids_behaviour_app');

  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RoutesConfig.appRouter,
    );
  }
}
