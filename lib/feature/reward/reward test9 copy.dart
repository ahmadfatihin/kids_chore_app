import 'package:flutter/material.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final list = [
      'Mini Toys',
      'Playground Ticket',
      'Money - 100 USD',
      'Money - 50 USD',
      'Money - 50 USD',
      'Snack',
      'Company stock 1000 units',
      'Steam Wallet'
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Button Pressed');
        },
        child: Icon(Icons.add, size: 40),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/bg_reward.png',
              width: 200,
              height: 150,
            ),
            Container(
              color: Colors.grey.withOpacity(0.3),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: const Text(
                      'Reward List',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        padding: EdgeInsets.all(20),
                        color: index.isEven
                            ? Colors.blueAccent.withOpacity(0.2)
                            : Colors.redAccent.withOpacity(0.2),
                        child: Row(
                          children: [
                            Text('$index'),
                            SizedBox(width: 5),
                            Text(list[index]),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
