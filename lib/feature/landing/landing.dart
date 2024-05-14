import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kids_chore_app/core/routes/routes_config.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 237, 213, 1),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Kids Chores',
              style: TextStyle(fontSize: 48),
            ),
            const Text(
              'Bringing Family Closer',
              style: TextStyle(fontSize: 20),
            ),
            Image.asset('assets/images/ilus_1.png'),
            Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () =>
                        context.push(RoutesConfig.login, extra: true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(155, 195, 255, 1),
                    ),
                    child: const Text(
                      'Login as Parent',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () =>
                        context.push(RoutesConfig.login, extra: false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(155, 195, 255, 1),
                    ),
                    child: const Text(
                      'Login as Child',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
