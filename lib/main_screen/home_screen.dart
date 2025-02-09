import 'package:flutter/material.dart';

import '../widget/home_button.dart';
import '../widget/office_button.dart';
import '../widget/summary_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHomeSelected = true;
  String? workStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: const Color(0xff0b56a5),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hey Buntek!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 2,
                            ),
                          ),
                          Text(
                            'Make your attendance!',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/bby.jpg'),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: workStatus == null ? 330 : 410,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -40,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: workStatus == null ? 370 : 450,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 10, top: 20),
                        child: Column(
                          children: [
                            if (workStatus == null)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Work Type',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isHomeSelected = true;
                                            });
                                          },
                                          highlightColor: Colors.transparent,
                                          child: Container(
                                            width: 100,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: isHomeSelected
                                                  ? const Color(0xff0b56a5)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.home,
                                                    color: isHomeSelected
                                                        ? Colors.white
                                                        : const Color(
                                                            0xff0b56a5),
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    'Home',
                                                    style: TextStyle(
                                                      color: isHomeSelected
                                                          ? Colors.white
                                                          : const Color(
                                                              0xff0b56a5),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isHomeSelected = false;
                                            });
                                          },
                                          highlightColor: Colors.transparent,
                                          child: Container(
                                            width: 100,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: isHomeSelected
                                                  ? Colors.transparent
                                                  : const Color(0xff0b56a5),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.work,
                                                    color: isHomeSelected
                                                        ? const Color(
                                                            0xff0b56a5)
                                                        : Colors.white,
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    'Office',
                                                    style: TextStyle(
                                                      color: isHomeSelected
                                                          ? const Color(
                                                              0xff0b56a5)
                                                          : Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
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
                                ],
                              ),
                            const SizedBox(
                              height: 30,
                            ),
                            isHomeSelected
                                ? const HomeButton()
                                : OfficeButton(
                                    workStatus: workStatus,
                                    onCheckOut: () {
                                      setState(() {
                                        workStatus = "CheckedOut";
                                      });
                                    },
                                    onTakeBreak: () {
                                      setState(() {
                                        workStatus = "OnBreak";
                                      });
                                    },
                                  )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 300,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 290,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Attendance',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.keyboard_double_arrow_right,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              'Summary',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const summary()
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
