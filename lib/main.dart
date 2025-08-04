import 'package:flutter/material.dart';
import 'package:nikkah_screens/screens/create_%20account_%20Type_screen.dart';
import 'package:nikkah_screens/screens/create_account_screen.dart';
import 'package:nikkah_screens/screens/nikah_plus_screen.dart';
import 'screens/splash_logo_screen.dart';
import 'screens/choose_auth_screen.dart';
import 'screens/login_screen.dart';
 // ✅ Get Started screen import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color goldColor = Color(0xFFB68E58);
    const Color whiteColor = Colors.white;

    return MaterialApp(
      title: 'Nikah App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
        primaryColor: goldColor,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: goldColor,
          secondary: whiteColor,
          background: whiteColor,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: goldColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),

      // Initial screen shown when app opens
      home: const SplashLogoScreen(),

      // Named routes for navigation
      routes: {
        '/auth-options': (context) => const ChooseAuthScreen(),
        '/login': (context) => const LoginScreen(),
        '/creat-account': (context) => const CreateAccountScreen(),
        '/nikah-plus': (context) => const NikahPlusScreen(),
        '/create-account-type': (context) => const CreateAccountTypeScreen()
      },
    );
  }
}
