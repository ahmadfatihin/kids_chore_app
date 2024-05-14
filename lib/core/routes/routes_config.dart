import 'package:go_router/go_router.dart';
import 'package:kids_chore_app/feature/home/home.dart';
import 'package:kids_chore_app/feature/landing/landing.dart';
import 'package:kids_chore_app/feature/splash/splash.dart';

class RoutesConfig {
  static GoRouter appRouter = GoRouter(initialLocation: splash, routes: [
    GoRoute(
      path: splash,
      builder: (ctx, state) => const Splash(),
    ),
    GoRoute(
      path: landing,
      builder: (ctx, state) => const Landing(),
    ),
    GoRoute(
      path: home,
      builder: (ctx, state) => const Home(),
    ),
  ]);

  static String splash = '/splash';
  static String landing = '/landing';
  static String home = '/home';
}
