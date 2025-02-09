import 'package:flutter/material.dart';

class day_of_week extends StatelessWidget {
  day_of_week({
    super.key,
    required this.day,
    required this.dayofweek,
    required this.time_in,
    required this.time_out,
    required this.total_H,
  });

  final String day, dayofweek, time_in, time_out;
  final String total_H;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 50,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(dayofweek),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                const Icon(
                  Icons.access_alarm,
                  size: 20,
                ),
                const SizedBox(height: 5),
                Text(
                  time_in,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Check in',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Icon(
                  Icons.alarm_off,
                  size: 20,
                ),
                const SizedBox(height: 5),
                Text(
                  time_out,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Check Out',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Icon(
                  Icons.alarm_on,
                  size: 20,
                ),
                const SizedBox(height: 5),
                Text(
                  total_H,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Total Hrs',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
