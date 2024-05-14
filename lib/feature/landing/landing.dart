import 'package:flutter/material.dart';

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
            const Text(
              'Kids Chores',
              style: TextStyle(fontSize: 48),
            ),
            Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {},
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
                    onPressed: () {},
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
