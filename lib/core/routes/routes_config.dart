import 'package:go_router/go_router.dart';
import 'package:kids_chore_app/feature/home/home.dart';
import 'package:kids_chore_app/feature/landing/landing.dart';
import 'package:kids_chore_app/feature/login/login.dart';
import 'package:kids_chore_app/feature/splash/splash.dart';
import 'package:kids_chore_app/feature/todo/todo_screen.dart';

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
      path: login,
      builder: (ctx, state) {
        final parent = state.extra as bool;
        return Login(parent: parent);
      },
    ),
    GoRoute(
      path: home,
      builder: (ctx, state) => const Home(),
    ),
    GoRoute(
      path: task,
      builder: (ctx, state) => TaskScreen(),
    ),
  ]);

  static String splash = '/splash';
  static String landing = '/landing';
  static String login = '/login';
  static String home = '/home';
  static String task = '/task';
}
