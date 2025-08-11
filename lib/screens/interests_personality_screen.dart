import 'package:flutter/material.dart';

const Color goldColor = Color(0xFFB9986D);
const Color lightBgColor = Color(0xFFF5F1EB);

class InterestsPersonalityScreen extends StatefulWidget {
  const InterestsPersonalityScreen({super.key});

  @override
  State<InterestsPersonalityScreen> createState() => _InterestsPersonalityScreenState();
}

class _InterestsPersonalityScreenState extends State<InterestsPersonalityScreen> {
  final List<String> interestsList = [
    'Reading', 'Traveling', 'Cooking', 'Sports', 'Art', 'Music',
    'Nature', 'Technology', 'Volunteering', 'Islamic Studies',
    'Fitness', 'Photography', 'Writing', 'Business', 'Family Activities', 'Gym'
  ];

  final List<String> personalityList = [
    'Kind', 'Spiritual', 'Ambitious', 'Patient', 'Creative', 'Organized',
    'Outgoing', 'Analytical', 'Adventurous', 'Reserved', 'Humorous', 'Traditional'
  ];

  List<String> selectedInterests = [];
  List<String> selectedPersonality = [];

  void toggleSelection(List<String> selectedList, String item, int maxLimit) {
    setState(() {
      if (selectedList.contains(item)) {
        selectedList.remove(item);
      } else {
        if (selectedList.length < maxLimit) {
          selectedList.add(item);
        }
      }
    });
  }

  Widget buildCheckboxList(List<String> items, List<String> selectedList) {
    return Wrap(
      spacing: 15,
      runSpacing: 5,
      children: items.map((item) {
        final isSelected = selectedList.contains(item);
        return InkWell(
          onTap: () => toggleSelection(selectedList, item, 5),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected ? goldColor.withOpacity(0.3) : Colors.transparent,
              border: Border.all(
                color: isSelected ? goldColor : Colors.grey.shade400,
                width: 1.2,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: isSelected,
                  onChanged: (_) => toggleSelection(selectedList, item, 5),
                  activeColor: goldColor,
                ),
                Text(
                  item,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Interests & Personality",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Tell us about yourself to help find compatible matches.*",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              const Text(
                "Select your interests (choose up to 5)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              buildCheckboxList(interestsList, selectedInterests),
              const SizedBox(height: 25),

              const Text(
                "Select your interests (choose up to 5)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              buildCheckboxList(personalityList, selectedPersonality),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add navigation or save logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: goldColor,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
