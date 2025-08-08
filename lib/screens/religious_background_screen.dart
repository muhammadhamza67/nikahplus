import 'package:flutter/material.dart';

class ReligiousBackgroundScreen extends StatefulWidget {
  const ReligiousBackgroundScreen({super.key});

  @override
  State<ReligiousBackgroundScreen> createState() => _ReligiousBackgroundScreenState();
}

class _ReligiousBackgroundScreenState extends State<ReligiousBackgroundScreen> {
  String? religiosity;
  String? prayerLevel;
  String? madhabLocation;

  final beigeColor = const Color(0xFFF7F1E8);
  final borderColor = Colors.brown.shade200;

  final religiosityOptions = [
    'Very practicing',
    'Moderately Practicing',
    'Somewhat practicing',
    'Not very practising',
    'Cultural connection only',
  ];

  final prayerOptions = [
    'Five times daily',
    'Most prayers daily',
    'Friday prayers only',
    'Occasionally',
    'Rarely/Never',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beigeColor,
      appBar: AppBar(
        backgroundColor: beigeColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Religious Background',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tell us about your religious practices to help find compatible matches.*',
              style: TextStyle(
                fontSize: 14,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 20),

            /// How Religious Are You?
            const Text(
              'How Religious Are You?*',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            buildDropdown(
              value: religiosity,
              items: religiosityOptions,
              hint: 'Very practicing',
              onChanged: (val) => setState(() => religiosity = val),
            ),

            const SizedBox(height: 20),

            /// Prayer Level
            const Text(
              'Prayer Level?*',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            buildDropdown(
              value: prayerLevel,
              items: prayerOptions,
              hint: 'Five times daily',
              onChanged: (val) => setState(() => prayerLevel = val),
            ),

            const SizedBox(height: 20),

            /// Madhab / School of Thought
            const Text(
              'Madhab/School of thoughts',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: madhabLocation,
                  hint: const Text('City, Country*'),
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: ['Hanafi - Pakistan', 'Shafi - Egypt', 'Hanbali - Saudi Arabia']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => madhabLocation = val),
                ),
              ),
            ),

            const Spacer(),

            /// Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null, // Disabled as in the screenshot
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE3D5C8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown({
    required String? value,
    required List<String> items,
    required String hint,
    required void Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.brown.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          hint: Text(hint),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
