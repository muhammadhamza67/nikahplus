import 'package:flutter/material.dart';

class BioRephraseScreen extends StatefulWidget {
  const BioRephraseScreen({super.key});

  @override
  State<BioRephraseScreen> createState() => _BioRephraseScreenState();
}

class _BioRephraseScreenState extends State<BioRephraseScreen> {
  final TextEditingController _bioController = TextEditingController(
    text:
        "Amina, 29. Practicing Muslimah seeking a like minded partner for a blessed journey. I am passionate about my faith, family, and finding joy in the simple things. Whether its a quiet evening in or an adventure outdoors, I value connection and sincerity. Looking for a respectful, faith driven individual to share lifes blessings with.",
  );

  @override
  Widget build(BuildContext context) {
    const Color goldColor = Color(0xFFB9986D);
    const Color beigeColor = Color(0xFFEAE1D8);

    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tell Us More About Yourself",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Add your Bio",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              // Bio Text Box with AI Rephrase button
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    TextField(
                      controller: _bioController,
                      maxLines: 8,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // AI Rephrase logic
                        },
                        icon: const Icon(Icons.auto_fix_high, size: 14, color: goldColor),
                        label: const Text(
                          "AI Rephrase",
                          style: TextStyle(
                              fontSize: 12, color: goldColor, fontWeight: FontWeight.w500),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: goldColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Use AI to Enhance your Bio button
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    // AI Enhance bio logic
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: goldColor,
                    side: const BorderSide(color: goldColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text(
                    "Use AI to Enhance your Bio",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const Spacer(),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to next screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: goldColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
