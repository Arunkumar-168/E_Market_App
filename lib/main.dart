import 'package:e_market/UI_Design/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fruit List App',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}