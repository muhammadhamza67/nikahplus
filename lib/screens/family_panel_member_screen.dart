import 'package:flutter/material.dart';

class FamilyPanelMemberScreen extends StatelessWidget {
  const FamilyPanelMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Family Panel",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.share_outlined, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs
            Row(
              children: [
                _buildTab("Virtual Meetings", false),
                const SizedBox(width: 16),
                _buildTab("Family Members", true),
                const SizedBox(width: 16),
                _buildTab("Shared Notes", false),
              ],
            ),
            const SizedBox(height: 20),

            // Family involvement
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Family Involvement",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text(
                    "Invite family members to guide your marriage journey",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "The Family Panel allows your family members to participate in your marriage process, providing guidance and support while respecting your privacy.",
                    style: TextStyle(color: Colors.black87, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Info Banner
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "✅ You can add/remove members at any time, your family can adjust privacy settings as well.",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),

            // Family Members
            const Text("Your Family Members",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),

            _buildFamilyMemberTile(
              name: "Abdullah Khan",
              role: "Father • Family Advisor",
              avatar: "assets/male.png",
            ),
            const SizedBox(height: 12),
            _buildFamilyMemberTile(
              name: "Amina Khan",
              role: "Mother • Family Advisor",
              avatar: "assets/female.png",
            ),
            const SizedBox(height: 12),
            _buildFamilyMemberTile(
              name: "Yusuf Khan",
              role: "Brother • Family Advisor",
              avatar: "assets/male.png",
            ),

            const SizedBox(height: 20),

            // Family Feedback
            const Text("Family Feedback",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),

            _buildFeedbackTile(
              name: "Abdullah Khan",
              role: "Father",
              feedback:
                  "I’ve reviewed Ahmed’s profile and our conversation. He seems respectful and has good family values. I would like to know more about his long-term goals.",
              time: "2 hours ago • Regarding Ahmed Ibrahim",
            ),
            const SizedBox(height: 12),
            _buildFeedbackTile(
              name: "Amina Khan",
              role: "Mother",
              feedback:
                  "I like that Omar is established in his career and seems to have strong religious values. I would suggest asking about his family background and how he envisions married life.",
              time: "1 day ago • Regarding Omar Farooq",
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // Bottom nav bar
  static Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.home_outlined, color: Colors.grey),
          Icon(Icons.search_outlined, color: Colors.grey),
          Icon(Icons.favorite_border, color: Colors.grey),
          Icon(Icons.group_outlined, color: Color(0xFFB9986D)), // active tab
          Icon(Icons.person_outline, color: Colors.grey),
        ],
      ),
    );
  }

  // Tab widget
  static Widget _buildTab(String text, bool active) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: active ? Colors.black : Colors.grey,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const SizedBox(height: 4),
        if (active)
          Container(
            height: 3,
            width: 50,
            color: const Color(0xFFB9986D),
          )
      ],
    );
  }

  // Card wrapper
  static Widget _buildCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1),
        ],
      ),
      child: child,
    );
  }

  // Family Member tile
  static Widget _buildFamilyMemberTile({
    required String name,
    required String role,
    required String avatar,
  }) {
    return _buildCard(
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(avatar),
            radius: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                Text(role, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB9986D),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Message"),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Manage Access"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Feedback card
  static Widget _buildFeedbackTile({
    required String name,
    required String role,
    required String feedback,
    required String time,
  }) {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$name • $role",
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(feedback, style: const TextStyle(color: Colors.black87)),
          const SizedBox(height: 6),
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFFB9986D),
              side: const BorderSide(color: Color(0xFFB9986D)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Reply"),
          )
        ],
      ),
    );
  }
}
