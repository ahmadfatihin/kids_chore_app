import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/routes/routes_config.dart';

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
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  context.push(RoutesConfig.task);
                },
                child: Card(
                  color: const Color(0xFFFFF2C2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 16),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/barcode.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gifhary Shidqa Halim",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(Icons.male),
                                Text("22.12.2022"),
                              ],
                            ),
                            Text("Third child")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
