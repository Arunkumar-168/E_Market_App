import 'package:e_market/API_Service/Fruit_Service_page.dart';
import 'package:e_market/Common_API/Route_Page.dart';
import 'package:e_market/Model/Signup_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLoading = true.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>(); // Use public formKey for widget access

  @override
  void onInit() {
    super.onInit(); // ✅ only super.onInit()
  }

  void login() async {
    final result = await LoginService.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (result != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      prefs.setString('email', result.email);
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Login Failed', 'Invalid email or password');
    }
  }

  void signup() async {
    if (formKey.currentState?.validate() ?? false) {
      final signupModel = SignupModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        firstname: firstNameController.text.trim(),
        lastname: lastNameController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
        address: addressController.text.trim(),
      );

      final success = await SignupService.register(signupModel);

      if (success) {
        Get.snackbar('Signup Successful', 'You can now login.');
        Get.toNamed(RouteHelper.getLoginRoute());
      } else {
        Get.snackbar('Signup Failed', 'Try again with valid details.');
      }
    }
  }
}




// class AuthController extends GetxController {
//   var isLoading = true.obs;
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final addressController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   void login() async {
//     final result = await LoginService.login(
//       emailController.text.trim(),
//       passwordController.text.trim(),
//     );
//
//     if (result != null) {
//       final prefs = await SharedPreferences.getInstance();
//       prefs.setBool('isLoggedIn', true);
//       prefs.setString('email', result.email);
//       Get.offAllNamed('/home');
//     } else {
//       Get.snackbar('Login Failed', 'Invalid email or password');
//     }
//   }
//   void signup() async {
//     if (_formKey.currentState!.validate()) {
//       final signupModel = SignupModel(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//         firstname: firstNameController.text.trim(),
//         lastname: lastNameController.text.trim(),
//         confirmPassword: confirmPasswordController.text.trim(),
//         address: addressController.text.trim(),
//       );
//
//       final success = await SignupService.register(signupModel);
//
//       if (success) {
//         Get.snackbar('Signup Successful', 'You can now login.');
//         Get.offAllNamed('/login');
//       } else {
//         Get.snackbar('Signup Failed', 'Try again with valid details.');
//       }
//     }
//   }
//
// }