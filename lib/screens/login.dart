import 'package:flutter/material.dart';
import 'package:micro_map/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColour,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/logo.png',
                      height: 220,
                      width: 220,
                    ),
                  ),
                  const Text(
                    'Micro Map',
                    style: TextStyle(
                      fontSize: 24,
                      color: kBlueColour3,
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ),
                  const Text(
                    'please sign-in with your details',
                    style: TextStyle(
                      fontSize: 14,
                      color: kBlueColour3,
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: LoginContainer()),
          ],
        ),
      ),
    );
  }
}

class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Email',
              style: TextStyle(
                  fontSize: 12,
                  color: kBlueColour2,
                  fontFamily: 'Plus Jakarta Sans'),
            ),
            const SizedBox(height: 5.0),
            const InputWidget(
                icon: Icons.mail_outline_rounded, obscureText: false),
            const SizedBox(height: 16.0),
            const Text(
              'Password',
              style: TextStyle(
                  fontSize: 12,
                  color: kBlueColour2,
                  fontFamily: 'Plus Jakarta Sans'),
            ),
            const SizedBox(height: 5.0),
            const InputWidget(icon: Icons.key, obscureText: true),
            const SizedBox(height: 5.0),
            Container(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      fontSize: 14,
                      color: kBlueColour4,
                      fontFamily: 'Plus Jakarta Sans'),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Material(
              borderRadius: BorderRadius.circular(4),
              child: MaterialButton(
                onPressed: () {},
                color: kBlueColour2,
                minWidth: 200,
                height: 45,
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Plus Jakarta Sans',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget({super.key, required this.icon, required this.obscureText});

  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 270,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
            child: Icon(icon),
          ),
          const SizedBox(
            height: 28,
            child: VerticalDivider(
              thickness: 2,
              color: Colors.black26,
            ),
          ),
          Expanded(
            child: Container(
              height: 33,
              child: TextField(
                obscureText: obscureText,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
