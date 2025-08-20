import 'package:flutter/material.dart';
import 'package:nikkah_screens/screens/discover_%20matches_%20screen.dart';
 // ⬅️ import your Discover Matches screen

class MembershipPlansScreen extends StatelessWidget {
  const MembershipPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Membership Plans",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Upgrade Your Journey to Love",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Choose the plan that best fits your needs and unlock premium features to find your perfect match.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Billing Period Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _billingPeriod("Monthly", true),
                _billingPeriod("3 Months", false),
                _billingPeriod("6 Months", false),
                _billingPeriod("Yearly", false),
              ],
            ),
            const SizedBox(height: 20),

            // Free Plan
            _planCard(
              title: "Free",
              price: "\$0 /month",
              features: [
                "Create a profile",
                "Browse profiles (limited)",
                "5 likes per day",
                "Basic matching algorithm",
                "Chat with matches (limited)",
                "See who likes you",
              ],
              buttonText: "Select Plan",
              isPopular: false,
              isCurrent: false,
            ),
            const SizedBox(height: 20),

            // Silver Plan
            _planCard(
              title: "Silver",
              price: "\$19.99 /month",
              features: [
                "All Free features",
                "Unlimited chats",
                "Unlimited likes",
                "See who likes you",
                "Browse Firaa’s insights",
                "Advanced AI matching",
              ],
              buttonText: "Most Popular",
              isPopular: true,
              isCurrent: false,
            ),
            const SizedBox(height: 20),

            // Gold Plan
            _planCard(
              title: "Gold",
              price: "\$39.99 /month",
              features: [
                "All Silver features",
                "Priority in search results",
                "AI powered matching",
                "Full Firaa’s personality analysis",
                "Priority customer support",
                "Access to all profile photos",
              ],
              buttonText: "Your Current Plan",
              isPopular: false,
              isCurrent: true,
            ),
            const SizedBox(height: 30),

            // Feature Comparison
            const Text(
              "Feature Comparison",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _featureComparison(),
            const SizedBox(height: 30),

            // Upgrade button 🚀 with navigation
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006241),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DiscoverMatchesScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Upgrade to Gold",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                "You'll be charged \$39.99 monthly. Cancel anytime.",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Billing Period Widget
  Widget _billingPeriod(String text, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFEEE5DA) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? const Color(0xFFB9986D) : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // 🔹 Plan Card
  Widget _planCard({
    required String title,
    required String price,
    required List<String> features,
    required String buttonText,
    required bool isPopular,
    required bool isCurrent,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isPopular)
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFB9986D),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "MOST POPULAR",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            price,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF006241)),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: features
                .map((f) => Row(
                      children: [
                        const Icon(Icons.check,
                            color: Color(0xFFB9986D), size: 18),
                        const SizedBox(width: 6),
                        Expanded(child: Text(f)),
                      ],
                    ))
                .toList(),
          ),
          const SizedBox(height: 15),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isCurrent
                    ? Colors.grey.shade300
                    : const Color(0xFFB9986D),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 12),
              ),
              onPressed: () {},
              child: Text(
                buttonText,
                style: TextStyle(
                  color: isCurrent ? Colors.black : Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // 🔹 Feature Comparison Table
  Widget _featureComparison() {
    final features = [
      "Profile Creation",
      "Daily Likes",
      "See Who Likes You",
      "Advanced Filters",
      "Profile Boosts",
      "Firaa Insights",
      "AI Matching",
      "Access All Photos",
    ];

    final free = ["✔", "5", "✖", "✖", "✖", "✖", "Basic", "✖"];
    final silver = [
      "✔",
      "Unlimited",
      "✔",
      "✔",
      "1/month",
      "Basic",
      "Standard",
      "✔"
    ];
    final gold = [
      "✔",
      "Unlimited",
      "✔",
      "✔",
      "4/month",
      "Full Analysis",
      "Advanced",
      "✔"
    ];

    return Table(
      border: TableBorder.all(color: Colors.grey.shade300),
      columnWidths: const {
        0: FlexColumnWidth(3),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(2),
      },
      children: [
        _tableRow(["Feature", "Free", "Silver", "Gold"], isHeader: true),
        for (int i = 0; i < features.length; i++)
          _tableRow([features[i], free[i], silver[i], gold[i]]),
      ],
    );
  }

  TableRow _tableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells
          .map(
            (c) => Container(
              padding: const EdgeInsets.all(8),
              color: isHeader ? const Color(0xFFEEE5DA) : Colors.white,
              child: Text(
                c,
                style: TextStyle(
                  fontWeight:
                      isHeader ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
