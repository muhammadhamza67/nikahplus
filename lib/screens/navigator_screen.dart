import 'package:flutter/material.dart';

class NavigatorScreen extends StatelessWidget {
  const NavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Navigator Screen",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search by name, location, profession...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: TextButton(
                  onPressed: () {},
                  child: const Text("Filter"),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 🔘 Tabs
            Row(
              children: [
                ChoiceChip(
                  label: const Text("Guided Search"),
                  selected: true,
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text("Advanced Search"),
                  selected: false,
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text("Saved Searches"),
                  selected: false,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ✅ AI Recommendation Header
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "AI Powered Match Recommendations\n"
                "These are matches suggested based on your profile preferences.",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),

            // 👤 Profile Card 1
            buildProfileCard(
              image: "https://randomuser.me/api/portraits/women/44.jpg",
              name: "Fatima, 29",
              location: "Medina, KSA",
              profession: "Medical Doctor",
              matchPercent: 92,
              timeAgo: "2 hours ago",
            ),

            const SizedBox(height: 12),

            // 👤 Profile Card 2
            buildProfileCard(
              image: "https://randomuser.me/api/portraits/men/32.jpg",
              name: "Ahmed, 45",
              location: "Riyadh, KSA",
              profession: "Medical Doctor",
              matchPercent: 92,
              timeAgo: "2 hours ago",
            ),

            const SizedBox(height: 16),

            // 🔘 View More AI Recommendations
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("View More AI Recommendations"),
            ),
            const SizedBox(height: 16),

            // 📌 Search History
            const Text(
              "Your Search History",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              title: const Text("Ideal Match"),
              subtitle: const Text(
                  "Age 25-40, Doctor/Engineer, Practicing, Located in KSA"),
              trailing: const Icon(Icons.delete, color: Colors.red),
            ),
            ListTile(
              title: const Text("Local Matches"),
              subtitle: const Text("Male, 25-40, Active last week, Located in KSA"),
              trailing: const Icon(Icons.delete, color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Create New Saved Search"),
            ),
            const SizedBox(height: 16),

            // 📌 Recent Searches
            const Text(
              "Recent Searches",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text("Medical professionals in Riyadh"),
              trailing: TextButton(onPressed: () {}, child: const Text("Use")),
            ),
            ListTile(
              title: const Text("Teachers within 20km"),
              trailing: TextButton(onPressed: () {}, child: const Text("Use")),
            ),
            ListTile(
              title: const Text("Arabic speakers with PhD"),
              trailing: TextButton(onPressed: () {}, child: const Text("Use")),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Clear Recent Searches"),
            ),
            const SizedBox(height: 16),

            // ❤️ Enhance Search Section
            const Text(
              "Enhance Your Search Experience",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                buildEnhanceButton("AI Filters", Icons.tune),
                buildEnhanceButton("Family Panel", Icons.group),
                buildEnhanceButton("Nikah Calculator", Icons.calculate),
                buildEnhanceButton("Pious Insights", Icons.auto_awesome),
                buildEnhanceButton("Emotional Journey", Icons.favorite),
                buildEnhanceButton("AI Compatibility", Icons.analytics),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // 👤 Profile Card Widget
  Widget buildProfileCard({
    required String image,
    required String name,
    required String location,
    required String profession,
    required int matchPercent,
    required String timeAgo,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(image),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(location, style: const TextStyle(color: Colors.grey)),
                      Text(profession,
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Text("$matchPercent%",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green)),
              ],
            ),
            const SizedBox(height: 8),
            Text("Matched based on your profile, values, and preferences.",
                style: const TextStyle(color: Colors.black87)),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text("Connect"),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text("View Compatibility"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ⚙️ Enhance Search Button
  Widget buildEnhanceButton(String text, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.brown),
        ),
      ),
      icon: Icon(icon),
      label: Text(text),
    );
  }
}
