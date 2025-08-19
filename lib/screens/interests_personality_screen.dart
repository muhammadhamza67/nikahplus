import 'package:flutter/material.dart';
import 'voice_video_intro_screen.dart'; // Import your actual VoiceVideoIntroScreen file

const Color goldColor = Color(0xFFB9986D);
const Color whiteColor = Colors.white;

class InterestsPersonalityScreen extends StatefulWidget {
  const InterestsPersonalityScreen({super.key});

  @override
  State<InterestsPersonalityScreen> createState() =>
      _InterestsPersonalityScreenState();
}

class _InterestsPersonalityScreenState
    extends State<InterestsPersonalityScreen> {
  List<String> interests1 = [
    "Reading", "Cooking", "Art", "Nature", "Volunteering",
    "Fitness", "Writing", "Family Activities",
    "Traveling", "Sports", "Music", "Technology",
    "Islamic Studies", "Photography", "Business", "Gym"
  ];

  List<String> interests2 = [
    "Kind", "Ambitious", "Creative", "Outgoing",
    "Adventurous", "Humorous",
    "Spiritual", "Patient", "Organized", "Analytical",
    "Reserved", "Traditional"
  ];

  Set<String> selected = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: const Text(
          "Interests & Personality",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tell us about yourself to help find compatible matches.*",
                style: TextStyle(color: goldColor, fontSize: 14),
              ),
              const SizedBox(height: 8),
              buildSection("Select your interests (choose up to 5)", interests1),
              const SizedBox(height: 10),
              buildSection("Select your personality traits (choose up to 5)", interests2),
              const SizedBox(height: 20),

              // Next Button → VoiceVideoIntroScreen
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: goldColor,
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VoiceVideoIntroScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 6),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 36,
            crossAxisSpacing: 6,
            mainAxisSpacing: 0,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            String interest = items[index];
            bool isSelected = selected.contains(interest);

            return InkWell(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selected.remove(interest);
                  } else {
                    if (selected.length < 5) {
                      selected.add(interest);
                    }
                  }
                });
              },
              child: Row(
                children: [
                  Checkbox(
                    value: isSelected,
                    onChanged: (value) {
                      setState(() {
                        if (isSelected) {
                          selected.remove(interest);
                        } else {
                          if (selected.length < 5) {
                            selected.add(interest);
                          }
                        }
                      });
                    },
                    activeColor: goldColor,
                    side: const BorderSide(color: goldColor, width: 1.2),
                  ),
                  Expanded(
                    child: Container(
                      color: isSelected ? goldColor : whiteColor,
                      child: Text(
                        interest,
                        style: TextStyle(
                          fontSize: 14,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
