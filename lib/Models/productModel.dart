import 'package:json_annotation/json_annotation.dart';

class Product {
  late final String id;
  late final String image;
  late final String name;
  late final String type;
  late final String description;
  late final String subDescription;
  late final int price;

  Product({
    this.id = '',
    required this.image,
    required this.name,
    required this.type,
    required this.description,
    this.subDescription = '',
    required this.price
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,
    'name': name,
    'type': type,
    'description': description,
    'subdescription': subDescription,
    'price': price,
  };

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      type: json['type'],
      description: json['description'],
      subDescription: json['subDescription'],
      price: json['price']
  );
}


