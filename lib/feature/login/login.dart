import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final bool parent;
  const Login({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 0, left: 0, child: Image.asset('assets/images/bg.png')),
          parent ? const ParentLogin() : const KidsLogin(),
        ],
      ),
    );
  }
}

class KidsLogin extends StatelessWidget {
  const KidsLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome',
            style: TextStyle(fontSize: 32),
          ),
          const Text(
            'Buddy!',
            style: TextStyle(fontSize: 64),
          ),
          const Text(
            'Please scan with parent account, at Children Options > Scan and will be automatically login.',
            textAlign: TextAlign.center,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromRGBO(155, 195, 255, 1), width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset('assets/images/barcode.png'),
          ),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(155, 195, 255, 1),
              ),
              child: const Text(
                'Refresh',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ParentLogin extends StatelessWidget {
  const ParentLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome',
            style: TextStyle(fontSize: 32),
          ),
          const Text(
            'Parents',
            style: TextStyle(fontSize: 64),
          ),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Forgot password?',
                style: TextStyle(
                  color: Color.fromRGBO(155, 195, 255, 1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
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
        ],
      ),
    );
  }
}
