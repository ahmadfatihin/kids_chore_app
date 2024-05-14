import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final bool parent;
  const Home({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset('assets/images/bg_parent.png')),
          parent ? const ParentHome() : const KidsHome(),
        ],
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
    return Column(
      children: [],
    );
  }
}
