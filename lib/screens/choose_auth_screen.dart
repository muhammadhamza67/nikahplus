import 'package:flutter/material.dart';
import 'signup_screen.dart';

class ChooseAuthScreen extends StatelessWidget {
  const ChooseAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const goldColor = Color(0xFFB89B7D); // Main gold color

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/hands_touching.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Foreground
          Column(
            children: [
              const Spacer(),

              // Logo in center
              Center(
                child: Image.asset(
                  'lib/assets/images/logo2.png',
                  height: 70,
                  width: 70,
                  color: Colors.white,
                ),
              ),

              const Spacer(),

              // White rounded container with buttons
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Create an account button (filled)
                    SizedBox(
                      width: 280, // width updated
                      height: 56, // height updated
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const SignupScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: goldColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                        child: const Text(
                          "Create an account",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Sign In button (outlined)
                    SizedBox(
                      width: 280, // same width
                      height: 56, // same height
                      child: OutlinedButton(
                        onPressed: () {
                          // Add navigation later if needed
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: goldColor, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
