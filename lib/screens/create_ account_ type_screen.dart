import 'package:flutter/material.dart';
import 'tell_us_more_screen.dart'; // Adjust path as needed

class CreateAccountTypeScreen extends StatefulWidget {
  const CreateAccountTypeScreen({super.key});

  @override
  State<CreateAccountTypeScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountTypeScreen> {
  String selectedRole = 'For Myself';
  String? selectedLocation;

  final List<String> locations = [
    'Lahore, Pakistan',
    'Karachi, Pakistan',
    'Islamabad, Pakistan',
    'Sahiwal, Pakistan',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to Nikah Plus",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Let's create your profile to find your perfect match. This will take about 5 - 7 minutes.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "I am creating an account",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              // Option 1: For Myself
              _buildRoleOption(
                label: "For Myself",
                description: "I am looking for a spouse",
                icon: Icons.person,
              ),

              const SizedBox(height: 12),

              // Option 2: As a Wali/Guardian
              _buildRoleOption(
                label: "As a Wali/Guardian",
                description: "What's your gender?*",
                icon: Icons.account_circle_outlined,
              ),

              const SizedBox(height: 12),

              // Option 3: As a Mother
              _buildRoleOption(
                label: "As a Mother",
                description: "What's your gender?*",
                icon: Icons.lock_outline,
              ),

              const SizedBox(height: 24),

              const Text("Where do you live?", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),

              // Dropdown for city/country
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: const Text("City, Country*"),
                    value: selectedLocation,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        selectedLocation = value;
                      });
                    },
                    items: locations
                        .map((location) => DropdownMenuItem(
                              value: location,
                              child: Text(location), // ✅ COMMA FIXED HERE
                            ))
                        .toList(),
                  ),
                ),
              ),

              const Spacer(),

              // Next button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TellusMoreScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
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
      ),
    );
  }

  Widget _buildRoleOption({
    required String label,
    required String description,
    required IconData icon,
  }) {
    final bool isSelected = selectedRole == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
              : Colors.white,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.shade300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.black54),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
