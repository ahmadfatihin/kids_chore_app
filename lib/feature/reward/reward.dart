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
      'Snack',
      'Company stock 1000 units',
      'Steam Wallet'
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromRGBO(155, 195, 255, 1),
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/bg_reward.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'List',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                ListView(
                  shrinkWrap: true,
                  children: List.generate(
                    list.length,
                    (index) => Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 242, 194, 0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text('${index + 1}.'),
                          SizedBox(width: 10),
                          Text(list[index]),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
