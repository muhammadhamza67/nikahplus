import 'package:flutter/material.dart';

const Color goldColor = Color(0xFFB9986D);
const Color selectedBgColor = Color(0xFFEEE5DA);
const Color unselectedBgColor = Color(0xFFFFFFFF);
const Color selectedTextColor = Color(0xFFFFFFFF);
const Color unselectedTextColor = Color(0xFFB9986D);

class MarriageFamilyScreen extends StatefulWidget {
  const MarriageFamilyScreen({super.key});

  @override
  State<MarriageFamilyScreen> createState() => _MarriageFamilyScreenState();
}

class _MarriageFamilyScreenState extends State<MarriageFamilyScreen> {
  String maritalStatus = "Never Married";
  String haveChildren = "No";
  String wantChildren = "Yes";
  String relocateForMarriage = "No";

  Widget buildOption(
      String text, String groupValue, Function(String) onChanged) {
    bool isSelected = text == groupValue;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => onChanged(text)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: isSelected ? selectedBgColor : unselectedBgColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: selectedBgColor),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? goldColor : Colors.grey[700],
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(List<String> options, String groupValue,
      Function(String) onChanged) {
    return Row(
      children: [
        for (int i = 0; i < options.length; i++) ...[
          buildOption(options[i], groupValue, onChanged),
          if (i != options.length - 1) const SizedBox(width: 10),
        ]
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Marriage & Family",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            const Text(
              "Tell us about your marital status and family plans.*",
              style: TextStyle(color: Color(0xFFB9986D)),
            ),
            const SizedBox(height: 20),

            const Text(
              "Marital status",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            buildRow(
              ["Never Married", "Divorced", "Widowed"],
              maritalStatus,
              (val) => maritalStatus = val,
            ),
            const SizedBox(height: 20),

            const Text(
              "Do you have children?",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            buildRow(
              ["Yes", "No"],
              haveChildren,
              (val) => haveChildren = val,
            ),
            const SizedBox(height: 20),

            const Text(
              "Do you want children in the future?",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            buildRow(
              ["Yes", "No"],
              wantChildren,
              (val) => wantChildren = val,
            ),
            const SizedBox(height: 20),

            const Text(
              "Are you willing to relocate for marriage?",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            buildRow(
              ["Yes", "No"],
              relocateForMarriage,
              (val) => relocateForMarriage = val,
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: goldColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                onPressed: () {},
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
}
