import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
 // Adjust path as per your folder structure


class AddBirthdateScreen extends StatefulWidget {
  const AddBirthdateScreen({super.key});

  @override
  State<AddBirthdateScreen> createState() => _AddBirthdateScreenState();
}

class _AddBirthdateScreenState extends State<AddBirthdateScreen> {
  int selectedDay = 1;
  int selectedMonth = 0;
  int selectedYear = 1991;

  List<String> months = List.generate(
      12, (index) => DateFormat.MMMM().format(DateTime(0, index + 1)));
  List<int> years = List.generate(40, (index) => 1991 + index);

  int getAge() {
    final today = DateTime.now();
    final birthDate = DateTime(selectedYear, selectedMonth + 1, selectedDay);
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
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
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Add Your Birthdate*",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Day Picker
                  SizedBox(
                    width: 80,
                    child: CupertinoPicker(
                      itemExtent: 40,
                      magnification: 1.2,
                      diameterRatio: 2.5,
                      squeeze: 1.2,
                      scrollController:
                          FixedExtentScrollController(initialItem: selectedDay - 1),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedDay = index + 1;
                        });
                      },
                      selectionOverlay: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFBFA273),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      children: List.generate(
                        31,
                        (index) => Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedDay == index + 1
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: selectedDay == index + 1
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Month Picker
                  SizedBox(
                    width: 120,
                    child: CupertinoPicker.builder(
                      itemExtent: 40,
                      magnification: 1.2,
                      diameterRatio: 2.5,
                      squeeze: 1.2,
                      scrollController:
                          FixedExtentScrollController(initialItem: selectedMonth),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedMonth = index % 12;
                        });
                      },
                      selectionOverlay: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFBFA273),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      childCount: 10000, // big number for infinite looping
                      itemBuilder: (context, index) {
                        final monthIndex = index % 12;
                        final isSelected = monthIndex == selectedMonth;
                        return Center(
                          child: Text(
                            months[monthIndex],
                            style: TextStyle(
                              fontSize: 16,
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight:
                                  isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Year Picker
                  SizedBox(
                    width: 100,
                    child: CupertinoPicker(
                      itemExtent: 40,
                      magnification: 1.2,
                      diameterRatio: 2.5,
                      squeeze: 1.2,
                      scrollController:
                          FixedExtentScrollController(initialItem: selectedYear - 1991),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedYear = years[index];
                        });
                      },
                      selectionOverlay: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFBFA273),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      children: List.generate(
                        years.length,
                        (index) {
                          final isSelected = years[index] == selectedYear;
                          return Center(
                            child: Text(
                              '${years[index]}',
                              style: TextStyle(
                                fontSize: 16,
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight:
                                    isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Age Text with lines on sides
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: const Color(0xFFBFA273),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "You are 29 years old",
                      style: TextStyle(
                        color: Color(0xFFBFA273),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: const Color(0xFFBFA273),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Next Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/user-info');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBFA273),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
