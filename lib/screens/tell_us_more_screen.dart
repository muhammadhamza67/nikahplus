import 'package:flutter/material.dart';
import 'add_birthdate_screen.dart'; // Make sure this path is correct

class TellusMoreScreen extends StatefulWidget {
  const TellusMoreScreen({super.key});

  @override
  State<TellusMoreScreen> createState() => _TellUsMoreScreenState();
}

class _TellUsMoreScreenState extends State<TellusMoreScreen> {
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _nickNameController = TextEditingController();

  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tell Us More About Yourself',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text("Add Your Full Name*", style: TextStyle(fontSize: 15)),
            const SizedBox(height: 12),
            _buildInputField(_firstNameController, "First Name*"),
            const SizedBox(height: 12),
            _buildInputField(_middleNameController, "Middle Name"),
            const SizedBox(height: 12),
            _buildInputField(_lastNameController, "Last Name*"),
            const SizedBox(height: 24),
            const Text("Do you have any Nick Name?", style: TextStyle(fontSize: 15)),
            const SizedBox(height: 12),
            _buildInputField(_nickNameController, "Nick Name"),
            const SizedBox(height: 24),
            const Text("What's your gender?*", style: TextStyle(fontSize: 15)),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildGenderOption("Male", colorScheme),
                const SizedBox(width: 16),
                _buildGenderOption("Female", colorScheme),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _isFormValid()
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddBirthdateScreen(),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isFormValid()
                      ? colorScheme.primary
                      : colorScheme.surfaceVariant,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  bool _isFormValid() {
    return _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        selectedGender != null;
  }

  Widget _buildInputField(TextEditingController controller, String hint) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontWeight: FontWeight.w400),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildGenderOption(String gender, ColorScheme colorScheme) {
    final isSelected = selectedGender == gender;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGender = gender;
          });
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: colorScheme.background,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isSelected ? colorScheme.primary : Colors.grey.shade400,
              width: 1.5,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            gender,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isSelected ? colorScheme.primary : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
