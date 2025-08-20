import 'package:flutter/material.dart';
import 'package:nikkah_screens/screens/membership_%20plans_%20screen.dart';
 // ✅ Import your MembershipPlansScreen

const Color goldColor = Color(0xFFB9986D);
const Color beigeColor = Color(0xFFF5F2EE);

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beigeColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting
                const Text(
                  "Assalamu Alaikum, Amina",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Begin your journey to a blessed union",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 20),

                // Featured Matches Carousel
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Featured Matches",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("View All"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 220,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _matchCard(
                        imageUrl:
                            "https://via.placeholder.com/150",
                        name: "Ahmed, 28",
                        profession: "Software Engineer",
                        tags: ["Practicing", "Family oriented"],
                        matchPercent: 92,
                      ),
                      _matchCard(
                        imageUrl: "https://via.placeholder.com/150",
                        name: "Fatima, 27",
                        profession: "Doctor",
                        tags: ["Hijabi", "Caring"],
                        matchPercent: 89,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // View All Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: goldColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: const Text("View All",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 20),

                // Explore Features
                const Text(
                  "Explore Features",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    _featureIcon("Ask the Mufti", Icons.question_answer),
                    _featureIcon("Family Panel", Icons.family_restroom),
                    _featureIcon("Mahr Calculator", Icons.calculate),
                    _featureIcon("Fiqaa Insights", Icons.book),
                    _featureIcon("Emotional Journey", Icons.favorite),
                    _featureIcon("AI Companion", Icons.smart_toy),
                    _featureIcon("Nikah Navigator", Icons.search),
                  ],
                ),
                const SizedBox(height: 20),

                // Your Journey Section
                const Text(
                  "Your Journey",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.check_circle, color: goldColor),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Your profile is 85% complete\nAdd more details to increase your matches",
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _journeyStat("12", "Profile Views"),
                            _journeyStat("5", "New Matches"),
                            _journeyStat("3", "Conversations"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // ✅ Upgrade Button with Navigation
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MembershipPlansScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "Upgrade to Nikah Gold",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 80), // space for bottom nav
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: goldColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  // --- Match Card Widget ---
  Widget _matchCard({
    required String imageUrl,
    required String name,
    required String profession,
    required List<String> tags,
    required int matchPercent,
  }) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(imageUrl,
                height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                Text(profession,
                    style: const TextStyle(fontSize: 12, color: Colors.black54)),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 4,
                  children: tags
                      .map((t) => Chip(
                            label: Text(t, style: const TextStyle(fontSize: 10)),
                            backgroundColor: beigeColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: matchPercent / 100,
                  backgroundColor: Colors.grey.shade200,
                  color: Colors.green,
                  minHeight: 6,
                ),
                const SizedBox(height: 6),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 36),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("View Profile",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Feature Icon Widget ---
  Widget _featureIcon(String title, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 26,
          child: Icon(icon, color: goldColor, size: 26),
        ),
        const SizedBox(height: 6),
        Text(title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.black87)),
      ],
    );
  }

  // --- Journey Stat Widget ---
  Widget _journeyStat(String count, String label) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: goldColor)),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }
}
