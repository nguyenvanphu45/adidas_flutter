import 'package:adidas_app/Components/loader.dart';
import 'package:adidas_app/utils/application_state.dart';
import 'package:adidas_app/utils/defaultElements.dart';
import 'package:adidas_app/utils/firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../Components/listCard.dart';
import '../Models/cartModel.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  Future<List<Cart>>? carts;

  void initState() {
    super.initState();
    carts = FirestoreUtil.getCart(
        Provider.of<ApplicationState>(context, listen: false).user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Giỏ hàng'.toUpperCase(),
        ),
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                ),
              ],
            ),
          )
        ],
      ),
      body: FutureBuilder<List<Cart>>(
        future: carts,
        builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(18, 6, 0, 4),
                  child: Text(
                    '${snapshot.data?.length.toString()}' + ' mặt hàng',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListCart(cart: snapshot.data![index]);
                          },
                ))),
                Container(
                    padding: EdgeInsets.fromLTRB(18, 10, 10, 6),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Tổng'.toUpperCase(),
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('đã tính thuế',
                                    style:
                                        Theme.of(context).textTheme.labelSmall)
                              ],
                            ),
                            priceFooter(snapshot.data!)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: DefaultElements.black,
                              padding: EdgeInsets.fromLTRB(10, 22, 10, 20),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.zero)),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Thanh toán'.toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: DefaultElements.white,
                                      fontSize: 20,
                                      letterSpacing: 1.4),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: DefaultElements.white,
                                  size: 24,
                                )
                              ],
                            ))
                      ],
                    )),
              ],
            );
          } else if (snapshot.data != null && snapshot.data!.isEmpty) {
            return Text('Không có sản phẩm!!!');
          }
          return Loader();
        },
      ),
    );
  }

  priceFooter(List<Cart> carts) {
    var formatter = NumberFormat.decimalPattern();
    return Text(
      '\$ ' + '${formatter.format(FirestoreUtil.getCartTotal(carts))}',
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
