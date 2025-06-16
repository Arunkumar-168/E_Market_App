import 'package:e_market/Controller/Fruit_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fruit List')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<FruitController>(
          init: FruitController(),
          builder: (controller) {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: controller.fruitList.length,
              itemBuilder: (context, index) {
                final fruit = controller.fruitList[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(fruit.fruitName[0]),
                    ),
                    title: Text(fruit.fruitName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price: ${fruit.price}"),
                        Text("Color: ${fruit.color}"),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
