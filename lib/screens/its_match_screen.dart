import 'package:flutter/material.dart';
import 'package:nikkah_screens/screens/family_panel_screen.dart';
// ⬅️ Import the Family Panel screen

class ItsMatchScreen extends StatelessWidget {
  const ItsMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 8),

              // Title
              const Text(
                "Discover Matches",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 20),

              // Upgrade card
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00BFA6), Color(0xFF007F73)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Upgrade to Nika7 Gold",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "See who likes you & unlock premium features",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Upgrade"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Overlapping Images with Heart
              Stack(
                alignment: Alignment.center,
                children: [
                  // Left image
                  Transform.translate(
                    offset: const Offset(-60, 0), // shift left
                    child: Transform.rotate(
                      angle: -0.1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          "lib/assets/images/profile.png",
                          width: 160,
                        ),
                      ),
                    ),
                  ),

                  // Right image
                  Transform.translate(
                    offset: const Offset(60, 0), // shift right
                    child: Transform.rotate(
                      angle: 0.1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          "lib/assets/images/woman.png",
                          width: 160,
                        ),
                      ),
                    ),
                  ),

                  // Heart in center
                  Positioned(
                    bottom: 20,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.favorite, color: Colors.red, size: 28),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Match text
              const Text(
                "It’s a match, Amina",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B4F2A),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Start a conversation now with each other",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const Spacer(),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB9986D),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // ⬅️ Navigate to Family Panel Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FamilyPanelScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Say Salaam",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5F2EE),
                    foregroundColor: Colors.black54,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Keep swiping → go back
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Keep swiping",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
