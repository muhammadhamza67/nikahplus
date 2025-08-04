import 'package:flutter/material.dart';
import 'package:nikkah_screens/screens/create_%20account_%20Type_screen.dart';
// ✅ Correct file name

class NikahPlusScreen extends StatelessWidget {
  const NikahPlusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image, strongly shifted up
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/hands_touching.png',
              fit: BoxFit.cover,
              alignment: const Alignment(0, 2), // Shift image upward
            ),
          ),

          // Logo and texts at the top center
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Image.asset(
                    'lib/assets/images/logo.png',
                    height: 90,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Welcome to Nikah Plus",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                const Text(
                  "WHERE HEART MEETS THE PURPOSE",
                  style: TextStyle(
                    fontSize: 13,
                    letterSpacing: 1,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Bottom white container with button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
              color: Colors.white,
              child: SizedBox(
                height: 52,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountTypeScreen(), // ✅ Class name
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFB9986D),
                    side: const BorderSide(color: Color(0xFFB9986D), width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Begin Now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
