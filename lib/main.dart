import 'package:budget_tracker/views/components/home_component.dart';
import 'package:budget_tracker/views/screens/category_page.dart';
import 'package:budget_tracker/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/home_component',
          page: () => HomeComponent(),
        ),
        GetPage(
          name: '/category_page',
          page: () => CategoryPage(),
        ),
      ],
    );
  }
}
