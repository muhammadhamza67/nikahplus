import 'package:flutter/material.dart';
import 'match_screen.dart'; // ✅ Import your next screen

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.library_books_outlined, color: Colors.grey, size: 30),
            Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 30),
            Icon(Icons.favorite, color: Color(0xFFB9986D), size: 35),
            Icon(Icons.star_border, color: Colors.grey, size: 30),
            Icon(Icons.notifications_none, color: Colors.grey, size: 30),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              "Discover Matches",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Upgrade Banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFE6F5F1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      "Upgrade to Nika7 Gold\nSee who likes you & unlock premium features",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0DA97F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      "Upgrade",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Profile Card
            Expanded(
              child: Center(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Image.asset(
                              "lib/assets/images/profile.jpg", // replace with your image
                              height: 190, // smaller height
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        color: Colors.blue, size: 16),
                                    SizedBox(width: 3),
                                    Text("1 km",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Name, Age & Profession
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Mohammad Ali, 33",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Text(
                              "Charted Accountant",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white70),
                            ),
                            const SizedBox(height: 10),

                            // Tags
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: const [
                                _TagChip(text: "Practicing"),
                                _TagChip(text: "Most Prayers Daily"),
                                _TagChip(text: "Humorous"),
                                _TagChip(text: "Knows Arabic"),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // ✅ View Profile Button → Navigate to MatchScreen
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MatchScreen(), // your next screen
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFB9986D),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 12),
                                ),
                                child: const Text(
                                  "View Full Profile",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Like/Dislike/Favorite Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _CircleButton(
                      icon: Icons.close, color: Colors.teal, bg: Colors.white),
                  _CircleButton(
                      icon: Icons.favorite,
                      color: Colors.white,
                      bg: const Color(0xFFB9986D),
                      size: 40),
                  _CircleButton(
                      icon: Icons.star_border,
                      color: Colors.teal,
                      bg: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String text;
  const _TagChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 12),
      ),
      backgroundColor: const Color(0xFFE8DED2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color bg;
  final double size;
  const _CircleButton(
      {required this.icon,
      required this.color,
      required this.bg,
      this.size = 30});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: bg,
      child: Icon(icon, color: color, size: size),
    );
  }
}
