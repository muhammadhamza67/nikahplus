import 'package:flutter/material.dart';

const Color goldColor = Color(0xFFB9986D);
const Color beigeColor = Color(0xFFF5F2EE);

class DiscoverMatchesScreen extends StatelessWidget {
  const DiscoverMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Center(
                child: Text(
                  "Discover Matches",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),

              // Upgrade Banner
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Upgrade to Nika7 Gold\nSee who likes you & unlock premium features",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        // No navigation
                      },
                      child: const Text("Upgrade"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Profile Card
              Expanded(
                child: Center(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Profile Image (centered, visible, proper size)
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20)),
                          child: Image.asset(
                            "lib/assets/images/profile.jpg", // correct path
                            height: 250, // medium size
                            width: double.infinity,
                            fit: BoxFit.contain, // full picture visible
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Distance
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: const [
                              Icon(Icons.location_on,
                                  size: 16, color: Colors.grey),
                              SizedBox(width: 4),
                              Text("1 km",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        ),

                        // Name + Profession
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Mohammad Ali, 33",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                "Chartered Accountant",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black54),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Quick View button
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 12, bottom: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: goldColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "Quick View",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
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

      // Bottom Action Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: beigeColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: const Icon(Icons.layers, size: 28, color: Colors.black54),
                onPressed: () {}),
            CircleAvatar(
              radius: 28,
              backgroundColor: goldColor.withOpacity(0.2),
              child: const Icon(Icons.favorite,
                  size: 32, color: Colors.black),
            ),
            IconButton(
                icon:
                    const Icon(Icons.star, size: 28, color: Colors.black54),
                onPressed: () {}),
            IconButton(
                icon:
                    const Icon(Icons.person, size: 28, color: Colors.black54),
                onPressed: () {}),
            IconButton(
                icon:
                    const Icon(Icons.message, size: 28, color: Colors.black54),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
