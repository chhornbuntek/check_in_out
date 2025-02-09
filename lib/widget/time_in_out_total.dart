import 'package:flutter/material.dart';

class time_in_out_total extends StatelessWidget {
  const time_in_out_total({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Icon(Icons.access_alarm),
            const SizedBox(height: 5),
            const Text(
              '09:05 AM',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              'Check in',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Icon(Icons.alarm_off),
            const SizedBox(height: 5),
            const Text(
              '--:-- PM',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              'Check Out',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Icon(Icons.alarm_on),
            const SizedBox(height: 5),
            const Text(
              '8h 39m',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              'Total Hrs',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
