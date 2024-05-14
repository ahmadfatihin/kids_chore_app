import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kids_chore_app/core/di/injector.dart';
import 'package:kids_chore_app/core/routes/routes_config.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('com.wolkk.kids_behaviour_app');

  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(),
      ),
      routerConfig: RoutesConfig.appRouter,
    );
  }
}
