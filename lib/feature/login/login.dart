import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kids_chore_app/core/routes/routes_config.dart';

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
          Text(
            'Welcome',
            style: TextStyle(fontSize: 32),
          ),
          Text(
            'Buddy!',
            style: TextStyle(fontSize: 64),
          ),
          Text(
            'Please scan with parent account, at Children Options > Scan and will be automatically login.',
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border:
                  Border.all(color: Color.fromRGBO(155, 195, 255, 1), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: GestureDetector(
                onTap: () {
                  context.push(RoutesConfig.task, extra: false);
                },
                child: Image.asset('assets/images/barcode.png')),
          ),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                context.push(RoutesConfig.task, extra: false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(155, 195, 255, 1),
              ),
              child: Text(
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
          Text(
            'Welcome',
            style: TextStyle(fontSize: 32),
          ),
          Text(
            'Parents',
            style: TextStyle(fontSize: 64),
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
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
          SizedBox(height: 25),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                context.push(RoutesConfig.task);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(155, 195, 255, 1),
              ),
              child: Text(
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
