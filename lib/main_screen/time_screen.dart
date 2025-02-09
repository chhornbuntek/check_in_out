import 'package:app_attendance/widget/modal_month_year.dart';
import 'package:app_attendance/widget/summary_widget.dart';
import 'package:app_attendance/widget/time_in_out_total.dart';
import 'package:flutter/material.dart';

import '../widget/day_of_week.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  List<Map<String, String>> weeks = [
    {'title': 'Week 1', 'dateRange': '07 - 13 Jan'},
  ];

  List<Map<String, String>> years = [
    {'year': '2020'},
    {'year': '2021'},
    {'year': '2022'},
    {'year': '2023'},
    {'year': '2024'},
    {'year': '2025'},
  ];

  List<Map<String, String>> months = [
    {'month': 'January'},
    {'month': 'February'},
    {'month': 'March'},
    {'month': 'April'},
    {'month': 'May'},
    {'month': 'June'},
    {'month': 'July'},
    {'month': 'August'},
    {'month': 'September'},
    {'month': 'October'},
    {'month': 'November'},
    {'month': 'December'},
  ];

  Set<int> expandedWeeks = {};
  Set<int> expandedMonth = {};
  int? selectedIndex;

  void toggleWeek(int index) {
    setState(() {
      if (expandedWeeks.contains(index)) {
        expandedWeeks.remove(index);
      } else {
        expandedWeeks.add(index);
      }
    });
  }

  void toggleMonth(int index) {
    setState(() {
      if (expandedMonth.contains(index)) {
        expandedMonth.remove(index);
      } else {
        expandedMonth.clear();
        expandedMonth.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Attendance',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'May 2025',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showModal(context);
                            },
                            icon: const Icon(Icons.calendar_month),
                          )
                        ],
                      ),
                      Text(
                        'Summary',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const summary(),
                      const SizedBox(height: 10),
                      Text(
                        'Weeks',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: weeks.length,
                          itemBuilder: (context, index) {
                            return _buildWeekContainer(
                              title: weeks[index]['title']!,
                              dateRange: weeks[index]['dateRange']!,
                              isExpanded: expandedWeeks.contains(index),
                              onToggle: () => toggleWeek(index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekContainer({
    required String title,
    required String dateRange,
    required bool isExpanded,
    required VoidCallback onToggle,
  }) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: isExpanded
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )
                    : BorderRadius.circular(15),
                color: Colors.grey.shade200,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        dateRange,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: onToggle,
                    icon: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  )
                ],
              ),
            ),
            if (isExpanded) _buildDropdownContentWeeks(),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownContentWeeks() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              day_of_week(
                day: '01',
                dayofweek: 'Mon',
                time_in: '08:05 AM',
                time_out: '04:59 PM',
                total_H: '8h 39m',
              ),
              day_of_week(
                day: '02',
                dayofweek: 'Tue',
                time_in: '08:00 AM',
                time_out: '05:00 PM',
                total_H: '8h',
              ),
              day_of_week(
                day: '03',
                dayofweek: 'Wed',
                time_in: '08:15 AM',
                time_out: '04:45 PM',
                total_H: '8h 20m',
              ),
            ],
          )
        ],
      ),
    );
  }

  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return FractionallySizedBox(
              heightFactor: 0.7,
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Select Month',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                          itemCount: years.length,
                          itemBuilder: (context, index) {
                            return _buildMonthContainer(
                              year: years[index]['year']!,
                              isExpanded: expandedMonth.contains(index),
                              onToggle: () {
                                setModalState(() {
                                  toggleMonth(index);
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildMonthContainer({
    required String year,
    required bool isExpanded,
    required VoidCallback onToggle,
  }) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: isExpanded
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )
                    : BorderRadius.circular(15),
                color: Colors.grey.shade200,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        year,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: onToggle,
                    icon: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  )
                ],
              ),
            ),
            if (isExpanded) _buildDropdownContentMonth(),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownContentMonth() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: months.asMap().entries.map((entry) {
          int index = entry.key + 1;
          String monthName = entry.value['month']!;
          bool isSelected = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = isSelected ? -1 : index;
                });
              },
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        index.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    monthName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
