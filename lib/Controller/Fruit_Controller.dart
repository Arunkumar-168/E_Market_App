import 'package:e_market/API_Service/Fruit_Service_page.dart';
import 'package:e_market/Model/Fruit_Model.dart';
import 'package:get/get.dart';

class FruitController extends GetxController {
  var isLoading = true.obs;
  List<Fruit> fruitList = [];

  @override
  void onInit() {
    fetchFruits();
    super.onInit();
  }

  void fetchFruits() async {
    isLoading(true);
    final response = await FruitService.fetchFruits();
    if (response != null) {
      fruitList = response;
    }
    isLoading(false);
    update(); // Not needed if using Obx only
  }
}
