import 'package:flutter/material.dart';
import 'package:micro_map/constants.dart';

class SplashScreen extends StatefulWidget {
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
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animationColour = ColorTween(begin: kBlueColour1, end: kBackgroundColour)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    // Future.delayed(Duration(seconds: 3), () {
    //   Navigator.pushReplacementNamed(
    //       context, '/login'); // Replace '/main' with your main screen route.
    // });
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
            Image.asset(
              'assets/logo.png',
              width: 270,
              height: 270,
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
