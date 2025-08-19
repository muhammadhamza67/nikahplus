import 'package:flutter/material.dart';
import 'bio_rephrase_screen.dart'; // Import your new screen here

class BioScreen extends StatefulWidget {
  const BioScreen({super.key});

  @override
  State<BioScreen> createState() => _BiorephraseScreenState();
}

class _BiorephraseScreenState extends State<BioScreen> {
  final TextEditingController _bioController = TextEditingController();
  bool isNextEnabled = false;

  @override
  void initState() {
    super.initState();
    _bioController.addListener(() {
      setState(() {
        isNextEnabled = _bioController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }

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
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _bioController,
                  maxLines: 6,
                  decoration: const InputDecoration(
                    hintText:
                        "Tell us about yourself, your hobbies and future plans.....",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    // AI enhance bio logic here
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isNextEnabled
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BioRephraseScreen(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isNextEnabled ? goldColor : beigeColor,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: beigeColor,
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
