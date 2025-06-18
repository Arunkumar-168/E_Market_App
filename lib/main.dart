import 'package:e_market/Common_API/Route_Page.dart';
import 'package:e_market/Controller/Auth_Controller.dart';
import 'package:e_market/UI_Design/Auth/Login_Page.dart';
import 'package:e_market/UI_Design/Home_Page.dart';
import 'package:e_market/UI_Design/Splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fruit List App',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.getSplashRoute(),
      getPages: RouteHelper.routes,
    );
  }
}