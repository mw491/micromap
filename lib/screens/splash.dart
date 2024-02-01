import 'package:flutter/material.dart';
import 'package:micro_map/constants.dart';
import 'package:micro_map/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animationColour;
  late Animation animationSize;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animationColour = ColorTween(begin: kBlueColour1, end: kBackgroundColour)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginScreen(),
          transitionDuration:
              const Duration(milliseconds: 750), // Set the duration here
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            var offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animationColour.value,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/logo.png',
                height: 270,
                width: 270,
              ),
            ),
            const Text(
              'Micro Map',
              style: TextStyle(
                fontSize: 36,
                color: kBlueColour3,
                fontFamily: 'Plus Jakarta Sans',
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text(
                'clinically navigating the world of micro-organisms',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: kBlueColour3,
                  fontFamily: 'Plus Jakarta Sans',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
