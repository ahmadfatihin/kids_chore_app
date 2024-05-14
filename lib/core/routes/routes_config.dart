import 'package:go_router/go_router.dart';
import 'package:kids_chore_app/feature/home/home.dart';
import 'package:kids_chore_app/feature/landing/landing.dart';
import 'package:kids_chore_app/feature/login/login.dart';
import 'package:kids_chore_app/feature/manage_family/manage_family.dart';
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
      builder: (ctx, state) {
        final parent = state.extra as bool;
        return Home(parent: parent);
      },
    ),
    GoRoute(
      path: manageFamily,
      builder: (ctx, state) => const ManageFamily(),
    ),
    GoRoute(
      path: task,
      builder: (ctx, state) {
        final showFab =
            state.extra as bool? ?? true; // Default to true if not provided
        return TaskScreen(showFab: showFab);
      },
    ),
  ]);

  static String splash = '/splash';
  static String landing = '/landing';
  static String login = '/login';
  static String home = '/home';
  static String task = '/task';
  static String manageFamily = '/manageFamily';
}
