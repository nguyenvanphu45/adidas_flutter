import 'dart:ffi';

class Product {
  String id;
  String image;
  String name;
  String type;
  String description;
  String subDescription;
  int price;

  Product({
    this.id = '',
    required this.image,
    required this.name,
    required this.type,
    required this.description,
    required this.subDescription,
    required this.price
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,
    'name': name,
    'type': type,
    'description': description,
    'subdescription': subDescription,
    'price': price
  };

  static Product fromJson(Map<String, dynamic> json) => Product(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      type: json['type'],
      description: json['description'],
      subDescription: json['subDescription'],
      price: json['price']
  );
}


