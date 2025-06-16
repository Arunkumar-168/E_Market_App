import 'dart:convert';
import 'package:e_market/Common_API/Config_api.dart';
import 'package:e_market/Model/Fruit_Model.dart';
import 'package:http/http.dart' as http;

class FruitService {
  static const String fruit = '${baseUrl}fruit_details';
  static Future<List<Fruit>?>   fetchFruits() async {
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
