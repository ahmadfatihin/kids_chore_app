import 'package:flutter/material.dart';

class ManageFamily extends StatelessWidget {
  const ManageFamily({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color.fromRGBO(155, 195, 255, 1),
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Image.asset('assets/images/manage_family.png'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'List',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
