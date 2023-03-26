import 'package:adidas_app/Models/productModel.dart';

class Cart extends Product {
  int count = 0;
  Cart(String id, String image, String name, String type, String description,
      String price, this.count)
      : super(
            id: id,
            image: image,
            name: name,
            type: type,
            description: description,
            price: price
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,
    'name': name,
    'type': type,
    'description': description,
    'price': price,
    'count': count
  };

  static Cart fromJson(Map<String, dynamic> json) => Cart(
      json['id'] as String,
      json['image'] as String,
      json['name'] as String,
      json['type'] as String,
      json['description'] as String,
      json['price'] as String,
      (json['count'] as num).toInt()
  );
}