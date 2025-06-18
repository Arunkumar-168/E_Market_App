import 'package:e_market/UI_Design/Auth/Login_Page.dart';
import 'package:e_market/UI_Design/Auth/Signup_Page.dart';
import 'package:e_market/UI_Design/Home_Page.dart';
import 'package:e_market/UI_Design/Splash_Screen.dart';
import 'package:get/get.dart';


class RouteHelper {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';


  static String getSplashRoute() => splash;
  static String getLoginRoute() => login;
  static String getSignupRoute() => signup;
  static String getHomeRoute() => home;

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: signup, page: () => const SignupPage()),
    GetPage(name: home, page: () => HomePage()),
  ];
}
