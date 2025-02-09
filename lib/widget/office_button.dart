import 'package:app_attendance/widget/time_in_out_total.dart';
import 'package:flutter/material.dart';

class OfficeButton extends StatelessWidget {
  const OfficeButton({
    super.key,
    required this.workStatus,
    required this.onCheckOut,
    required this.onTakeBreak,
  });

  final String? workStatus;
  final VoidCallback onCheckOut;
  final VoidCallback onTakeBreak;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (workStatus == null) ...[
          const Text(
            '05:58:05 PM',
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
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onCheckOut,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color(0xff0b56a5),
                      width: 2,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Check out',
                      style: TextStyle(
                        color: Color(0xff0b56a5),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: onTakeBreak,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Container(
                  width: 190,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff0b56a5),
                  ),
                  child: const Center(
                    child: Text(
                      'Take a break',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ] else if (workStatus == "CheckedOut") ...[
          Transform.translate(
            offset: const Offset(0, -40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'The end of the day.',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/tree.png',
                  width: 190,
                  height: 190,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '08:00:50 AM',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 28,
                  ),
                ),
                const Text(
                  'Oct 26 2025 - Tuesday',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ] else if (workStatus == "OnBreak") ...[
          Transform.translate(
            offset: const Offset(0, -40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'It\'s your break time!',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/cup.png',
                  width: 110,
                  height: 110,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '08:00:50 AM',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 28,
                  ),
                ),
                const Text(
                  'Oct 26 2025 - Tuesday',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xff0b56a5),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'End',
                        style: TextStyle(
                          color: Color(0xff0b56a5),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        const Divider(),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: time_in_out_total(),
        ),
      ],
    );
  }
}
