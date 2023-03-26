import 'dart:developer';

import 'package:adidas_app/Models/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUtil {
  static const String productCollection = 'products';
  static const String customerCollection = 'customers';
  static const String cartCollection = 'cart';

  static Future<List<Product>> getProducts(List<String>? ids) async {
    try {
      final productRef = FirebaseFirestore.instance
          .collection(productCollection)
          .withConverter<Product>(
              fromFirestore: (snapshot, _) =>
                  Product.fromJson(snapshot.data()!),
              toFirestore: (product, _) => product.toJson());

      QuerySnapshot<Product> productDoc;

      if (ids != null && ids.isNotEmpty) {
        productDoc = await productRef.where('id', whereIn: ids).get();
      } else {
        productDoc = await productRef.get();
      }

      return productDoc.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e, stacktrace) {
      log("Error getting the products", stackTrace: stacktrace, error: e);
    }

    return [];
  }

  // static addToCart(User? user, String productId) async {
  //   if (user == null) return;
  //   try {
  //     DocumentReference<Map<String, dynamic>> product = FirebaseFirestore.instance
  //         .collection(customerCollection)
  //         .doc(user.uid)
  //         .collection(cartCollection)
  //         .doc(productId);
  //
  //     if ((await product.get()).exists) {
  //       product.update({'count: ': FieldValue.increment(1)});
  //     } else {
  //       product.set({'id': productId, 'count': 1});
  //     }
  //   } on FirebaseException catch (e, stackTrace) {
  //     log("Error adding to cart", stackTrace: stackTrace, error: e);
  //   }
  // }


}
