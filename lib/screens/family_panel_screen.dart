import 'package:flutter/material.dart';
import 'family_panel_member_screen.dart'; // 👈 Import the member screen

class FamilyPanelScreen extends StatelessWidget {
  const FamilyPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ AppBar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Family Panel",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.share_outlined, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),

      // ✅ Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs
            Row(
              children: [
                _buildTab("Virtual Meetings", true),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const FamilyPanelMemberScreen(),
                      ),
                    );
                  },
                  child: _buildTab("Family Members", false),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Virtual Meeting Room
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Virtual Meeting Room",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text(
                    "Connect with your match and family members",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "The Virtual Meeting Room allows you to arrange video calls, chats, and discussions between your, your match, and both families during the Khutuba (engagement) process.",
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
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "✅ You can schedule meetings, invite specific family members, and control the meeting agenda.",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),

            // Active Meeting
            const Text("Active Meeting",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Meeting with Ahmed Ibrahim’s family",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage("assets/meeting_preview.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Call Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.mic, color: Colors.black),
                      SizedBox(width: 16),
                      Icon(Icons.videocam, color: Colors.black),
                      SizedBox(width: 16),
                      Icon(Icons.chat, color: Colors.black),
                      SizedBox(width: 16),
                      Icon(Icons.call_end, color: Colors.red),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Join Call button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB9986D),
                        foregroundColor: Colors.white, // ✅ White text
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text("Join Call"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Scheduled Meetings
            const Text("Scheduled Meetings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
            _buildMeetingTile(
              title: "Khutuba Discussion with Omar’s Family",
              time: "Tomorrow, 7:00 PM",
              participants: "4 participants",
            ),
            const SizedBox(height: 12),
            _buildMeetingTile(
              title: "Mahr Discussion with Ahmed’s Family",
              time: "Jan 20th, 7:00 PM",
              participants: "6 participants",
            ),
            const SizedBox(height: 20),

            // Meeting Templates
            const Text("Meeting Templates",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
            _buildTemplateTile(
              title: "Initial Family Introduction",
              desc:
                  "A structured meeting to introduce both families and discuss initial compatibility.",
            ),
            const SizedBox(height: 12),
            _buildTemplateTile(
              title: "Khutuba (Engagement) Ceremony",
              desc:
                  "A structured meeting to introduce both families and discuss initial compatibility.",
            ),
          ],
        ),
      ),

      // ✅ Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFB9986D),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Family"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_call), label: "Meetings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
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

  // Card
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

  // Meeting card
  static Widget _buildMeetingTile({
    required String title,
    required String time,
    required String participants,
  }) {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          const SizedBox(height: 6),
          Text(time, style: const TextStyle(color: Colors.grey)),
          Text(participants, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),

          // ✅ Stacked buttons (vertical)
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB9986D),
                  foregroundColor: Colors.white, // ✅ White text
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(double.infinity, 45),
                ),
                child: const Text("Start Now"),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFB9986D)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(double.infinity, 45),
                ),
                child: const Text("Invite More"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Template card
  static Widget _buildTemplateTile({
    required String title,
    required String desc,
  }) {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(desc, style: const TextStyle(color: Colors.black87)),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFFB9986D),
              side: const BorderSide(color: Color(0xFFB9986D)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text("Use Template"),
          ),
        ],
      ),
    );
  }
}
