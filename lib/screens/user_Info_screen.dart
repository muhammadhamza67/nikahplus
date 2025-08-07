import 'package:flutter/material.dart';
import 'upload_photos_screen.dart'; // ✅ Import the upload screen

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final TextEditingController fullName1Controller = TextEditingController(text: "Amina");
  final TextEditingController fullName2Controller = TextEditingController(text: "Muhammad");
  final TextEditingController fullName3Controller = TextEditingController(text: "Ali");
  final TextEditingController nickNameController = TextEditingController(text: "Mena");

  int selectedGender = 1;

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xFFDDC8A1)),
          color: Colors.white,
        ),
        child: TextField(
          controller: controller,
          style: const TextStyle(fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            hintText: hintText,
            border: InputBorder.none,
            suffixIcon: controller.text.isNotEmpty
                ? const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.check,
                      color: Color(0xFFBFA273),
                    ),
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(minWidth: 24, minHeight: 24),
          ),
          onChanged: (value) {
            setState(() {}); // Refresh suffixIcon
          },
        ),
      ),
    );
  }

  Widget buildGenderButton(String label, int genderValue) {
    final bool isSelected = selectedGender == genderValue;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGender = genderValue;
          });
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFBFA273) : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isSelected ? const Color(0xFFBFA273) : const Color(0xFFDDC8A1),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : const Color(0xFFBFA273),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    fullName1Controller.dispose();
    fullName2Controller.dispose();
    fullName3Controller.dispose();
    nickNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Back button and title
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Tell Us More About Yourself",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Add Your Full Name*",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 10),

              buildTextField(controller: fullName1Controller, hintText: "Amina"),
              buildTextField(controller: fullName2Controller, hintText: "Muhammad"),
              buildTextField(controller: fullName3Controller, hintText: "Ali"),

              const SizedBox(height: 16),

              const Text(
                "Do you have any Nick Name?",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 10),

              buildTextField(controller: nickNameController, hintText: "Mena"),

              const SizedBox(height: 20),

              const Text(
                "What's your gender?*",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  buildGenderButton("Male", 0),
                  const SizedBox(width: 16),
                  buildGenderButton("Female", 1),
                ],
              ),

              const Spacer(),

              // ✅ Next button with navigation
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UploadPhotosScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBFA273),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
