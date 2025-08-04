import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'nikah_plus_screen.dart'; // 👈 Import your new screen

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => Navigator.pop(context),
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'lib/assets/images/logo.png',
                      height: 80,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Let's Get Started",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Sign up with Social or fill the form to continue.',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Email
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Amina123@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Name
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  hintText: 'Amina Ali',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Password
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: '*********',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "At least 6 characters, 1 uppercase letter, 1 number, 1 symbol",
                style: TextStyle(fontSize: 12, color: Colors.black45),
              ),
              const SizedBox(height: 16),

              // Terms and Conditions
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.brown,
                    value: agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        agreeToTerms = value!;
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
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Social Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: FaIcon(FontAwesomeIcons.xTwitter, color: Colors.white),
                  ),
                  SizedBox(width: 16),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: FaIcon(FontAwesomeIcons.facebookF, color: Colors.white),
                  ),
                  SizedBox(width: 16),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: FaIcon(FontAwesomeIcons.apple, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Create account button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    if (agreeToTerms) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NikahPlusScreen(), // 👈 Navigate to next screen
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please agree to the terms to continue.'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD6B084),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    "Create an account",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Already have an account
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text.rich(
                    TextSpan(
                      text: 'ALREADY HAVE AN ACCOUNT? ',
                      style: TextStyle(color: Colors.black54),
                      children: [
                        TextSpan(
                          text: 'SIGN IN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
