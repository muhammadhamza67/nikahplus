import 'package:flutter/material.dart';

class LinkedProfilesScreen extends StatelessWidget {
  const LinkedProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Heading
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Family Panel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Linked Profiles',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Linked Profiles Info Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.people, color: Colors.teal),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Linked Profiles\nManage profiles you\'ve created for your family members',
                              style: TextStyle(color: Colors.black87, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'As a guardian or parent, you can create and manage profiles for your children, helping them find suitable matches while respecting their preferences.',
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.info, color: Colors.teal),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'You can link your account with your children\'s profiles to help them in their marriage search journey.',
                                style: TextStyle(color: Colors.teal.shade900, fontSize: 13),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Text('Your Linked Profiles',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),

                // Profile Card 1
                _buildProfileCard(
                  name: "Fatima Khan",
                  detail: "28 years old daughter",
                  activity:
                      "Received a new match request from Omar (3 hours ago)\nSent a message to Ahmed (1 day ago)",
                  score: "87%",
                  matches: "12",
                ),

                const SizedBox(height: 16),

                // Profile Card 2
                _buildProfileCard(
                  name: "Ahmed Khan",
                  detail: "30 years old son",
                  activity:
                      "Received a new match request from Parveen (6 hours ago)\nSent a message to Saira (2 days ago)",
                  score: "92%",
                  matches: "8",
                ),

                const SizedBox(height: 24),

                // Privacy Settings
                Text('Profile Management',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Default Privacy Settings',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Edit',
                            style: TextStyle(color: Colors.teal, fontSize: 14),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildSwitchRow('Approve all matches first', true),
                      _buildSwitchRow('Allow direct messaging', true),
                      _buildSwitchRow('Notify of all profile activity', true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard({
    required String name,
    required String detail,
    required String activity,
    required String score,
    required String matches,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(detail,
                      style: TextStyle(color: Colors.black54, fontSize: 13)),
                ],
              ),
              Text('Active',
                  style: TextStyle(color: Colors.green, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 12),
          Text('Recent Activity',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(activity,
              style: TextStyle(color: Colors.black54, fontSize: 13)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(score,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Marriage Readiness',
                      style: TextStyle(color: Colors.black54, fontSize: 12)),
                ],
              ),
              Column(
                children: [
                  Text(matches,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Active Matches',
                      style: TextStyle(color: Colors.black54, fontSize: 12)),
                ],
              ),
              Text(
                'View All',
                style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchRow(String title, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 13, color: Colors.black87)),
          Switch(
            value: value,
            onChanged: (_) {},
            activeColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
