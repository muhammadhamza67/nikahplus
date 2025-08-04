import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                'lib/assets/images/logo.jpg',
                width: 140,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Center(
                child: SizedBox(
                  width: 250,
                  height: 55,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/auth-options'); // 👈 Go to hands screen
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(
                        color: theme.primaryColor,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Get Started",
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: theme.primaryColor,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
