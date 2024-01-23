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
                  const Hero(
                    tag: 'title',
                    child: Text(
                      'Micro Map',
                      style: TextStyle(
                        fontSize: 24,
                        color: kBlueColour3,
                        fontFamily: 'Plus Jakarta Sans',
                      ),
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
            Expanded(child: LoginContainer()),
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
      color: Colors.white,
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
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Perform login logic here
                Navigator.pop(context); // Close the login container
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
