import 'package:flutter/material.dart';
import 'education_career_screen.dart';

class ReligiousBackgroundScreen extends StatefulWidget {
  const ReligiousBackgroundScreen({super.key});

  @override
  State<ReligiousBackgroundScreen> createState() =>
      _ReligiousBackgroundScreenState();
}

class _ReligiousBackgroundScreenState extends State<ReligiousBackgroundScreen> {
  String religiosity = 'Very practicing';
  String prayerLevel = 'Five times daily';
  String? madhab;

  bool showReligiosityOptions = false;
  bool showPrayerOptions = false;

  final Color bg = const Color(0xFFFBF6F0);
  final Color borderColor = const Color(0xFFD9CBB9);
  final Color primaryText = const Color(0xFF4A3F35);
  final Color hintText = const Color(0xFFB9A998);
  final Color boxFill = Colors.white;
  final Color smallTickBg = const Color(0xFFD2B48C);
  final Color buttonBeige = const Color(0xFFE3D5C8);

  final List<String> religiosityOptions = [
    'Very practicing',
    'Moderately practicing',
    'Somewhat practicing',
    'Not very practising',
    'Cultural connection only',
  ];

  final List<String> prayerOptions = [
    'Five times daily',
    'Most prayers daily',
    'Friday prayers only',
    'Occasionally',
    'Rarely/Never',
  ];

  final List<String> madhabOptions = [
    'Hanafi - Pakistan',
    'Shafi - Egypt',
    'Hanbali - Saudi Arabia',
  ];

  void _goToNextScreen() {
    if (religiosity.isEmpty || prayerLevel.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all required fields')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EducationCareerScreen(),
      ),
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: primaryText,
      ),
    );
  }

  Widget _dropdownBox({
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: boxFill,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  color: primaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 28,
              height: 24,
              decoration: BoxDecoration(
                color: smallTickBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _optionsList({
    required List<String> items,
    required String selected,
    required ValueChanged<String> onSelect,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .where((item) => item != selected)
          .map((item) => GestureDetector(
                onTap: () {
                  onSelect(item);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 14, color: primaryText),
                  ),
                ),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Religious Background',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: primaryText,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tell us about your religious practices to help\nfind compatible matches.*',
                  style: TextStyle(
                    fontSize: 14,
                    color: primaryText.withOpacity(0.6),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 18),

                _label('How Religious Are You?*'),
                const SizedBox(height: 6),
                _dropdownBox(
                  value: religiosity,
                  onTap: () {
                    setState(() {
                      showReligiosityOptions = !showReligiosityOptions;
                    });
                  },
                ),
                if (showReligiosityOptions)
                  _optionsList(
                    items: religiosityOptions,
                    selected: religiosity,
                    onSelect: (val) {
                      setState(() {
                        religiosity = val;
                        showReligiosityOptions = false;
                      });
                    },
                  ),

                const SizedBox(height: 18),
                _label('Prayer Level?*'),
                const SizedBox(height: 6),
                _dropdownBox(
                  value: prayerLevel,
                  onTap: () {
                    setState(() {
                      showPrayerOptions = !showPrayerOptions;
                    });
                  },
                ),
                if (showPrayerOptions)
                  _optionsList(
                    items: prayerOptions,
                    selected: prayerLevel,
                    onSelect: (val) {
                      setState(() {
                        prayerLevel = val;
                        showPrayerOptions = false;
                      });
                    },
                  ),

                const SizedBox(height: 18),
                _label('Madhab/School of thoughts'),
                const SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                    color: boxFill,
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: madhab,
                      isExpanded: true,
                      hint: Text(
                        'City, Country*',
                        style: TextStyle(color: hintText),
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: madhabOptions
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(color: primaryText),
                                ),
                              ))
                          .toList(),
                      onChanged: (v) => setState(() => madhab = v),
                    ),
                  ),
                ),

                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _goToNextScreen,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonBeige,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
