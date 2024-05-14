import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kids_chore_app/core/routes/routes_config.dart';

class Home extends StatelessWidget {
  final bool parent;
  const Home({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset('assets/images/bg_parent.png')),
            parent ? const ParentHome() : const KidsHome(),
          ],
        ),
      ),
    );
  }
}

class KidsHome extends StatelessWidget {
  const KidsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}

class ParentHome extends StatelessWidget {
  const ParentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Hi, Parent',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Text(
            DateFormat('dd MMMM yyyy').format(DateTime.now()),
            style: const TextStyle(fontSize: 32),
          ),
          Text(
            DateFormat('hh:mm').format(DateTime.now()),
            style: const TextStyle(fontSize: 64),
          ),
          const SizedBox(height: 70),
          ListView(
            shrinkWrap: true,
            children: [
              AspectRatio(
                aspectRatio: 366 / 140,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 242, 194, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                              child: Text(
                                'Make a daily schedule with your child',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(155, 195, 255, 1),
                              ),
                              child: const Text(
                                'Create',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/images/calendar.png')
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 226, 230, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/images/family.png'),
                          const SizedBox(width: 10),
                          const Flexible(
                            child: Text(
                              'Manage your family',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(228, 226, 255, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/images/podium.png'),
                          const SizedBox(width: 10),
                          const Flexible(
                            child: Text(
                              'Track child progress',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () => context.push(RoutesConfig.manageReward),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 242, 194, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/images/gift.png'),
                            const SizedBox(width: 10),
                            const Flexible(
                              child: Text(
                                'Manage Rewards',
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Flexible(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 226, 230, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/images/clock.png'),
                          const SizedBox(width: 10),
                          const Flexible(
                            child: Text(
                              'History',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              AspectRatio(
                aspectRatio: 366 / 140,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 242, 194, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Scan QR',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      'This for connecting your child account',
                                      style: TextStyle(fontSize: 11),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(155, 195, 255, 1),
                              ),
                              child: const Text(
                                'Scan',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/images/scan.png')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
