import 'package:flutter/material.dart';

class NikahNavigatorScreen extends StatelessWidget {
  const NikahNavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Nikah Navigator",
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt, color: Colors.brown),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search by name, location, profession...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Filters Row
            Row(
              children: [
                _filterChip("Guided Search"),
                const SizedBox(width: 8),
                _filterChip("Advanced Search"),
                const SizedBox(width: 8),
                _filterChip("Saved Searches"),
              ],
            ),
            const SizedBox(height: 16),

            // Tab Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Discover", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("All Recommendations"),
                Text("Recent"),
              ],
            ),
            const SizedBox(height: 16),

            // Profile Card 1
            _profileCard(
              name: "Amina R, 28",
              location: "Dubai, UAE",
              distance: "5 km away",
              percentage: "92%",
              profession: "Medical Doctor",
              description:
                  "Passionate about healthcare and serving the community. Looking for someone who values family.",
              lastActive: "2 hours ago",
            ),
            const SizedBox(height: 16),

            // Profile Card 2
            _profileCard(
              name: "Yusuf H, 32",
              location: "Riyadh, KSA",
              distance: "15 km away",
              percentage: "88%",
              profession: "Software Engineer",
              description:
                  "Tech enthusiast who loves solving problems. Seeking a partner who values intellectual discussions.",
              lastActive: "Online now",
            ),
            const SizedBox(height: 16),

            // View All Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: () {},
                child: const Text("View All"),
              ),
            ),
            const SizedBox(height: 24),

            // Search History Section
            const Text(
              "Your Search History",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),

            // Saved Searches
            _savedSearchCard(
              title: "Ideal Match",
              details:
                  "Age: 26-30, Doctor/Engineer, Practicing, Family-oriented",
              time: "Last updated: 5d ago",
            ),
            _savedSearchCard(
              title: "Local Matches",
              details: "Within 10km, Active in last week",
              time: "Last updated: now",
            ),
            const SizedBox(height: 12),

            // Create New Saved Search Button
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.brown,
                  side: const BorderSide(color: Colors.brown),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text("Create New Saved Search"),
              ),
            ),
            const SizedBox(height: 24),

            // Recent Searches
            const Text(
              "Recent Searches",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _recentSearchChip("Medical professionals in Riyadh"),
            _recentSearchChip("Teachers within 20km"),
            _recentSearchChip("Arabic speakers with PhD"),
            const SizedBox(height: 12),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text("Clear Recent Searches"),
              ),
            ),
            const SizedBox(height: 24),

            // Enhance Search Experience
            const Text(
              "Enhance Your Search Experience",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),

            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _featureBox("Ask the Mufti", Icons.question_answer),
                _featureBox("Family Panel", Icons.people),
                _featureBox("Mahr Calculator", Icons.calculate),
                _featureBox("Firas Insights", Icons.lightbulb),
                _featureBox("Emotional Journey", Icons.favorite),
                _featureBox("AI Companion", Icons.smart_toy),
              ],
            ),

            const SizedBox(height: 24),

            // 🚀 Navigator Button (New)
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavigatorScreen()),
                  );
                },
                child: const Text(
                  "Go to Navigator Screen",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Widgets ...

  static Widget _filterChip(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.brown.shade100,
      labelStyle: const TextStyle(color: Colors.brown),
    );
  }

  static Widget _profileCard({
    required String name,
    required String location,
    required String distance,
    required String percentage,
    required String profession,
    required String description,
    required String lastActive,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.person, size: 50),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(location,
                          style: const TextStyle(color: Colors.grey)),
                      Text(distance,
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(percentage,
                      style: const TextStyle(color: Colors.white)),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(profession,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
            Text(description),
            const SizedBox(height: 4),
            Text(lastActive,
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  static Widget _savedSearchCard({
    required String title,
    required String details,
    required String time,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: ListTile(
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$details\n$time"),
        isThreeLine: true,
        trailing: const Icon(Icons.close, color: Colors.red),
      ),
    );
  }

  static Widget _recentSearchChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Chip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            const SizedBox(width: 8),
            const Text("Use", style: TextStyle(color: Colors.blue)),
          ],
        ),
        backgroundColor: Colors.grey.shade200,
      ),
    );
  }

  static Widget _featureBox(String title, IconData icon) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      elevation: 1,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.brown),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

// ➕ New Screen
class NavigatorScreen extends StatelessWidget {
  const NavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator Screen"),
      ),
      body: const Center(
        child: Text(
          "Welcome to Navigator Screen!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
