import 'package:app_attendance/main_screen/home_screen.dart';
import 'package:app_attendance/main_screen/time_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Navigationmenu extends StatelessWidget {
  const Navigationmenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: Colors.grey.withOpacity(0.2),
          height: 60,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(
              icon: Icon(Iconsax.clock),
              label: 'Time',
            ),
            NavigationDestination(
                icon: Icon(Iconsax.calendar), label: 'Calendar'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            NavigationDestination(
                icon: Icon(Iconsax.notification), label: 'Notification'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const TimeScreen(),
    Container(color: Colors.green),
    Container(color: Colors.grey),
    Container(color: Colors.yellow)
  ];

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = 0;
  }
}
