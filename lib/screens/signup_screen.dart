import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_screen.dart'; // Import your LoginScreen file

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Center(
                child: Image.asset(
                  'lib/assets/images/logo.png', // Replace with your logo path
                  height: 60,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Let’s Get Started",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Sign up with Social or fill the form to continue.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              _buildTextField(Icons.email_outlined, 'Email'),
              const SizedBox(height: 16),
              _buildTextField(Icons.person_outline, 'Name'),
              const SizedBox(height: 16),
              _buildTextField(Icons.lock_outline, 'Password', obscureText: true),
              const SizedBox(height: 6),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "At least 8 characters, 1 uppercase letter, 1 number, 1 symbol",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        agreeToTerms = value ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'By Signing up, you agree to the ',
                        children: [
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              // Social login icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _socialButton(FontAwesomeIcons.xTwitter),
                  _socialButton(FontAwesomeIcons.facebookF, iconColor: Colors.blue),
                  _socialButton(FontAwesomeIcons.apple, iconColor: Colors.black),
                ],
              ),
              const SizedBox(height: 30),
              // Create account button
              ElevatedButton(
                onPressed: () {
                  // TODO: Add sign up functionality or navigate to next screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB89B7D),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Create an account',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              // Sign in text with navigation to LoginScreen
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "ALREADY HAVE AN ACCOUNT? ",
                    style: TextStyle(color: Colors.brown),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "SIGN IN",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hintText,
      {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _socialButton(IconData iconData, {Color? iconColor}) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 24,
      child: Icon(
        iconData,
        color: iconColor ?? Colors.black,
        size: 22,
      ),
    );
  }
}
