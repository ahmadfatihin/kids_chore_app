import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return Column(
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
          Row(
            children: [
              Text(
                'Hi, Parent',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(
            DateFormat('dd MMMM yyyy').format(DateTime.now()),
            style: const TextStyle(fontSize: 32),
          ),
          Text(
            DateFormat('hh:mm').format(DateTime.now()),
            style: const TextStyle(fontSize: 64),
          ),
        ],
      ),
    );
  }
}
