import 'package:flutter/material.dart';
import 'home_dashboard_screen.dart'; // ✅ Import your dashboard screen

class IdealMatchScreen extends StatefulWidget {
  const IdealMatchScreen({super.key});

  @override
  State<IdealMatchScreen> createState() => _IdealMatchScreenState();
}

class _IdealMatchScreenState extends State<IdealMatchScreen> {
  RangeValues _ageRange = const RangeValues(29, 36);

  final List<String> ethnicityOptions = [
    'Arab',
    'African',
    'Turkish',
    'European',
    'Any',
    'South Asian',
    'Southeast Asian',
    'Persian/Iranian',
    'North American',
  ];
  final Map<String, bool> selectedEthnicities = {};

  String? locationPreference = 'Anywhere in the world';
  String? educationLevel = 'No preference';

  @override
  void initState() {
    super.initState();
    for (var e in ethnicityOptions) {
      selectedEthnicities[e] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF7F2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Ideal Match",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tell us what you’re looking for in a potential spouse.*",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFB9986D),
              ),
            ),
            const SizedBox(height: 20),

            // Age Range
            const Text(
              "Age range",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${_ageRange.start.round()} years"),
                Text("${_ageRange.end.round()} years"),
              ],
            ),
            RangeSlider(
              values: _ageRange,
              min: 18,
              max: 60,
              activeColor: const Color(0xFFB9986D),
              inactiveColor: Colors.grey,
              onChanged: (RangeValues values) {
                setState(() {
                  _ageRange = values;
                });
              },
            ),

            const SizedBox(height: 20),

            // Ethnicity
            const Text(
              "Ethnicity Preferences",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 4.5,
                children: ethnicityOptions.map((ethnicity) {
                  return Row(
                    children: [
                      Checkbox(
                        value: selectedEthnicities[ethnicity],
                        activeColor: const Color(0xFFB9986D),
                        onChanged: (val) {
                          setState(() {
                            selectedEthnicities[ethnicity] = val ?? false;
                          });
                        },
                      ),
                      Text(ethnicity),
                    ],
                  );
                }).toList(),
              ),
            ),

            // Location Preference
            const Text(
              "Location Preference",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField<String>(
              value: locationPreference,
              items: const [
                DropdownMenuItem(
                    value: 'Anywhere in the world',
                    child: Text('Anywhere in the world')),
                DropdownMenuItem(
                    value: 'Same country', child: Text('Same country')),
                DropdownMenuItem(value: 'Same city', child: Text('Same city')),
              ],
              onChanged: (value) => setState(() => locationPreference = value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Education Level
            const Text(
              "Minimum Education Level",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField<String>(
              value: educationLevel,
              items: const [
                DropdownMenuItem(
                    value: 'No preference', child: Text('No preference')),
                DropdownMenuItem(value: 'High School', child: Text('High School')),
                DropdownMenuItem(value: 'Bachelors', child: Text('Bachelors')),
                DropdownMenuItem(value: 'Masters', child: Text('Masters')),
                DropdownMenuItem(value: 'PhD', child: Text('PhD')),
              ],
              onChanged: (value) => setState(() => educationLevel = value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ✅ Find Matches Button with Navigation
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB9986D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeDashboardScreen()),
                  );
                },
                child: const Text(
                  "Find Matches",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
