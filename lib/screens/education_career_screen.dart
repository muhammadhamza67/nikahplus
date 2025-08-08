import 'package:flutter/material.dart';

class EducationCareerScreen extends StatefulWidget {
  const EducationCareerScreen({super.key});

  @override
  State<EducationCareerScreen> createState() => _EducationCareerScreenState();
}

class _EducationCareerScreenState extends State<EducationCareerScreen> {
  String? selectedEducation;
  String? selectedProfession;
  String? selectedEthnicity;

  Map<String, bool> languages = {
    'Arabic': false,
    'Urdu': false,
    'Turkish': false,
    'Spanish': false,
    'English': false,
    'French': false,
    'Farsi': false,
    'Bengali': false,
  };

  final List<String> educationOptions = [
    'High School',
    'Bachelor\'s',
    'Master\'s',
    'PhD',
  ];

  final List<String> professionOptions = [
    'Engineer',
    'Doctor',
    'Teacher',
    'Artist',
    'Business',
    'Student',
  ];

  final List<String> ethnicityOptions = [
    'Asian',
    'Arab',
    'Black',
    'White',
    'Mixed',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF8F3), // Light beige background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: 'Education',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ' & '),
              TextSpan(
                  text: 'Career',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tell us about your educational background and professional life.*',
              style: TextStyle(color: Color(0xFFB79D8D), fontSize: 14),
            ),
            const SizedBox(height: 20),
            _buildDropdown('Education Level', selectedEducation, educationOptions,
                (value) {
              setState(() {
                selectedEducation = value;
              });
            }),
            const SizedBox(height: 15),
            _buildDropdown('Profession', selectedProfession, professionOptions,
                (value) {
              setState(() {
                selectedProfession = value;
              });
            }),
            const SizedBox(height: 15),
            _buildDropdown('Ethnicity', selectedEthnicity, ethnicityOptions,
                (value) {
              setState(() {
                selectedEthnicity = value;
              });
            }),
            const SizedBox(height: 20),
            const Text(
              'Languages you know',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 4,
              children: languages.keys.map((lang) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: languages[lang],
                      onChanged: (val) {
                        setState(() {
                          languages[lang] = val!;
                        });
                      },
                      activeColor: const Color(0xFFB79D8D),
                    ),
                    Text(lang),
                  ],
                );
              }).toList(),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFFD7C7B8), // Muted beige
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String? selectedValue,
      List<String> options, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            isExpanded: true,
            underline: const SizedBox(),
            hint: Text(
              label == 'Profession'
                  ? 'What do you do for work?'
                  : 'Select an option',
              style: const TextStyle(color: Colors.grey),
            ),
            items: options
                .map((option) =>
                    DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
