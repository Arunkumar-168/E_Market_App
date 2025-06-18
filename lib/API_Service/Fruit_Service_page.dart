import 'dart:convert';
import 'package:e_market/Common_API/Config_api.dart';
import 'package:e_market/Model/Fruit_Model.dart';
import 'package:e_market/Model/Login_Model.dart';
import 'package:e_market/Model/Signup_Model.dart';
import 'package:http/http.dart' as http;

class FruitService {
  static const String fruit = '${baseUrl}fruit_details';

  static Future<List<Fruit>?> fetchFruits() async {
    try {
      final response = await http.get(Uri.parse(fruit));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((e) => Fruit.fromJson(e)).toList();
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}

class LoginService {
  static Future<LoginModel?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return LoginModel.fromJson(jsonData);
      } else {
        print("Login failed: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Login exception: $e");
      return null;
    }
  }
}


class SignupService {
  static Future<bool> register(SignupModel signupData) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(signupData.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        print("Signup failed: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Signup exception: $e");
      return false;
    }
  }
}