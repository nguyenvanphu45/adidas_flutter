import 'package:adidas_app/Models/productModel.dart';
import 'package:adidas_app/utils/defaultElements.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardGrid extends StatelessWidget {
  final int index;
  final void Function() onPress;
  final Product product;

  const CardGrid(
      {Key? key,
      required this.product,
      required this.index,
      required this.onPress})
      : super(key: key);

  Future<void> _deleteProduct(String productId) async {
    final CollectionReference _productss =
    FirebaseFirestore.instance.collection('products');
    await _productss.doc(productId).delete();
  }

  @override
  Widget build(BuildContext context) {
    String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
    var formatter = NumberFormat.decimalPattern();

    return GestureDetector(
      onTap: onPress,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        color: Color.fromRGBO(236, 239, 241, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(product.image),
                Positioned(
                    right: 6.0,
                    top: 8.0,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: null,
                            icon: const Icon(
                                Icons.edit,
                            )
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            size: 28,
                          ),
                          onPressed: () => _deleteProduct(product.id),
                        ),
                      ],
                    )
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(7, 10, 0, 0),
                      padding: const EdgeInsets.fromLTRB(12, 4, 12, 3),
                      decoration: BoxDecoration(
                        color: DefaultElements.white,
                      ),
                      child: Text(
                        "\₫${formatter.format(product.price)}",
                          style: Theme.of(context).textTheme.labelSmall)),
                  Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Text(
                      capitalize(product.type),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black26,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
