class Fruit {
  final int? id;
  final String fruitName;
  final String price;
  final String color;

  Fruit({
    this.id,
    required this.fruitName,
    required this.price,
    required this.color,
  });

  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(
      id: json['id'],
      fruitName: json['fruit_name'],
      price: json['price'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fruit_name': fruitName,
      'price': price,
      'color': color,
    };
  }
}
