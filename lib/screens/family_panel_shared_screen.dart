import 'package:flutter/material.dart';
import 'linked_profiles_screen.dart';

class FamilyPanelSharedScreen extends StatefulWidget {
  const FamilyPanelSharedScreen({super.key});

  @override
  State<FamilyPanelSharedScreen> createState() =>
      _FamilyPanelSharedScreenState();
}

class _FamilyPanelSharedScreenState extends State<FamilyPanelSharedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Family Panel",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicatorColor: Colors.brown,
          tabs: const [
            Tab(text: "Shared Conversations"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LinkedProfilesScreen()),
              );
            },
            child: const Text(
              "Linked Profiles",
              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // ---------------- Shared Conversations ----------------
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Conversations Shared with Family",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Manage All"),
                    )
                  ],
                ),
                const SizedBox(height: 12),

                // Conversation Cards
                _conversationCard(
                  name: "Ahmed Ibrahim",
                  relation: "Shared with: Father, Mother",
                  time: "2h ago",
                  message:
                      "Last message: Wa alaikum assalam! Yes, I would be interested in discussing that further...",
                ),
                _conversationCard(
                  name: "Omar Farooq",
                  relation: "Shared with: Father",
                  time: "1d ago",
                  message:
                      "Last message: I'd be happy to tell you more about my business. It's in the tech industry...",
                ),
                _conversationCard(
                  name: "Khalid Rahman",
                  relation: "Shared with: Mother, Brother",
                  time: "1d ago",
                  message:
                      "Last message: I believe family is the foundation of a strong marriage. My parents taught me...",
                ),

                const SizedBox(height: 20),

                // Privacy Settings
                const Text(
                  "Conversation Privacy Settings",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Default Sharing Settings",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Edit"),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      _privacySwitch("Share new matches with family", true),
                      _privacySwitch("Allow family to message matches", false),
                      _privacySwitch("Notify family of new conversations", true),
                      _privacySwitch("Auto-share serious conversations", false),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),

      // ---------------- Bottom Navigation ----------------
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        onTap: (index) {
          // TODO: Add navigation logic
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Discover"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Messages"),
          BottomNavigationBarItem(
              icon: Icon(Icons.family_restroom), label: "Family"),
        ],
      ),
    );
  }

  Widget _conversationCard({
    required String name,
    required String relation,
    required String time,
    required String message,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(time,
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          Text(relation,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 6),
          Text(message, style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _privacySwitch(String title, bool value) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      value: value,
      onChanged: (val) {},
    );
  }
}
