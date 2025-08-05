import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Add Your Birthdate*",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                      scrollController: FixedExtentScrollController(
                          initialItem: selectedDay - 1),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedDay = index + 1;
                        });
                      },
                      selectionOverlay: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFBFA273).withOpacity(0.2),
                          border: const Border.symmetric(
                            horizontal: BorderSide(
                                color: Color(0xFFBFA273), width: 1),
                          ),
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
                                  ? const Color(0xFFBFA273)
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
                    child: CupertinoPicker(
                      itemExtent: 40,
                      magnification: 1.2,
                      diameterRatio: 2.5,
                      squeeze: 1.2,
                      scrollController: FixedExtentScrollController(
                          initialItem: selectedMonth),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedMonth = index;
                        });
                      },
                      selectionOverlay: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFBFA273).withOpacity(0.2),
                          border: const Border.symmetric(
                            horizontal: BorderSide(
                                color: Color(0xFFBFA273), width: 1),
                          ),
                        ),
                      ),
                      children: List.generate(
                        months.length,
                        (index) => Center(
                          child: Text(
                            months[index],
                            style: TextStyle(
                              fontSize: 16,
                              color: index == selectedMonth
                                  ? const Color(0xFFBFA273)
                                  : Colors.black,
                              fontWeight: index == selectedMonth
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
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
                      scrollController: FixedExtentScrollController(
                          initialItem: selectedYear - 1991),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedYear = years[index];
                        });
                      },
                      selectionOverlay: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFBFA273).withOpacity(0.2),
                          border: const Border.symmetric(
                            horizontal: BorderSide(
                                color: Color(0xFFBFA273), width: 1),
                          ),
                        ),
                      ),
                      children: List.generate(
                        years.length,
                        (index) => Center(
                          child: Text(
                            '${years[index]}',
                            style: TextStyle(
                              fontSize: 16,
                              color: years[index] == selectedYear
                                  ? const Color(0xFFBFA273)
                                  : Colors.black,
                              fontWeight: years[index] == selectedYear
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Age Text
            Center(
              child: Text(
                "You are ${getAge()} years old",
                style: const TextStyle(
                  color: Colors.brown,
                  fontSize: 14,
                ),
              ),
            ),

            const Spacer(),

            // Next Button
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/next-screen');
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
