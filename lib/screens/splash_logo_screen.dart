import 'package:flutter/material.dart';
import 'get_started_screen.dart';

class SplashLogoScreen extends StatefulWidget {
  const SplashLogoScreen({super.key});

  @override
  State<SplashLogoScreen> createState() => _SplashLogoScreenState();
}

class _SplashLogoScreenState extends State<SplashLogoScreen> {
  @override
  void initState() {
    super.initState();

    // Auto navigation after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetStartedScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'lib/assets/images/logo.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
