import 'package:budget_tracker/views/components/home_component.dart';
import 'package:budget_tracker/views/screens/category_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;
  PageController pageController = PageController(
    initialPage: 0,
  );
  List<Widget> pages = [
    const HomeComponent(),
    const CategoryPage(),
  ];

  changeIndex({required int index}) {
    selectedIndex(index);
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
