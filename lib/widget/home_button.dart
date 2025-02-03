import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '08:00:50 AM',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 32,
          ),
        ),
        const Text(
          'Oct 26 2025 - Tuesday',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 130,
          height: 130,
          decoration: const BoxDecoration(
            color: Color(0xff91bcea),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xff0b56a5),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  'Check in',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Check in and get started on your successful day.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
