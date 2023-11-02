import 'package:budget_tracker/controller/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget Tracker"),
        centerTitle: true,
      ),
      body: PageView(
        onPageChanged: (index) {
          navigationController.changeIndex(index: index);
        },
        controller: navigationController.pageController,
        children: navigationController.pages,
      ),
      bottomNavigationBar: Obx(() {
        return NavigationBar(
          selectedIndex: navigationController.selectedIndex.value,
          onDestinationSelected: (index) {
            navigationController.changeIndex(index: index);
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.category), label: "Category"),
          ],
        );
      }),
    );
  }
}
