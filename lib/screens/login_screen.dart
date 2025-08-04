import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nikkah_screens/screens/create_account_screen.dart';
 // ✅ Make sure the path is correct

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(),
              const SizedBox(height: 10),

              // Logo
              Center(
                child: Image.asset(
                  'lib/assets/images/logo.png',
                  height: 70,
                ),
              ),

              const SizedBox(height: 30),

              const Center(
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Email
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Password
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Remember Me
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                    visualDensity: VisualDensity.compact,
                  ),
                  const Text(
                    'Remember Me',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Center(child: Text("Or Sign In Using Your Socials")),
              const SizedBox(height: 10),

              // Social Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: FaIcon(
                      FontAwesomeIcons.xTwitter,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 20),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: FaIcon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 20),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: FaIcon(
                      FontAwesomeIcons.apple,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Sign In Button
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC5A77E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // Handle Sign In Logic
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Sign Up link
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountScreen(),
                      ),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "DON’T HAVE AN ACCOUNT? ",
                      children: [
                        TextSpan(
                          text: "SIGN UP",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
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
