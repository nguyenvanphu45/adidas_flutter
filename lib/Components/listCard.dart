import 'package:adidas_app/utils/defaultElements.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/cartModel.dart';

class ListCart extends StatelessWidget {
  final Cart cart;
  ListCart({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.decimalPattern();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Container(
        color: Color.fromRGBO(237, 239, 240, 1),
        child: Row(
          children: [
            Container(
              child: Image.network(cart.image,
                  width: 130, height: 130, fit: BoxFit.fill),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(16, 6, 16, 5),
                    decoration: BoxDecoration(
                      color: DefaultElements.white,
                    ),
                    child: Text(
                      "\$ ${formatter.format(cart.price)}",
                      style: Theme.of(context).textTheme.labelMedium,
                    )),
                SizedBox(
                  height: 8,
                ),
                Text(
                  cart.name.toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Kích cỡ: 9.5 UK - Số lượng: ${cart.count}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
