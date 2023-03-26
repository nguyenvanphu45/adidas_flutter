import 'package:adidas_app/utils/data.dart';
import 'package:adidas_app/utils/defaultElements.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // List<Widget> buildProducts() {
  //   return Data.generateProducts()
  //       .map((e) => Container(
  //             color: Color.fromRGBO(237, 239, 240, 1),
  //             child: Row(
  //               children: [
  //                 Container(
  //                   child: Image.network(e.image,
  //                       width: 130, height: 130, fit: BoxFit.fill),
  //                 ),
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                     Container(
  //                         padding: const EdgeInsets.fromLTRB(16, 6, 16, 5),
  //                         decoration: BoxDecoration(
  //                           color: DefaultElements.white,
  //                         ),
  //                         child: Text(
  //                           "\$ ${e.price}",
  //                           style: Theme.of(context).textTheme.labelMedium,
  //                         )),
  //                     SizedBox(
  //                       height: 8,
  //                     ),
  //                     Text(
  //                       e.name,
  //                       style: Theme.of(context).textTheme.titleMedium,
  //                     ),
  //                     SizedBox(
  //                       height: 8,
  //                     ),
  //                     Text(
  //                       'Kích cỡ: 9.5 UK - Số lượng: 1',
  //                       style: Theme.of(context).textTheme.labelSmall,
  //                     ),
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ))
  //       .toList();
  // }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Container(
          //   padding: EdgeInsets.fromLTRB(18, 6, 0, 4),
          //   child: Text(
          //     buildProducts().length.toString() + ' mặt hàng',
          //     style: Theme.of(context).textTheme.labelMedium,
          //   ),
          // ),
          // Expanded(
          //     child: SingleChildScrollView(
          //         child: ListView.builder(
          //           scrollDirection: Axis.vertical,
          //           shrinkWrap: true,
          //           itemCount: buildProducts().length,
          //           itemBuilder: (BuildContext context, int index) {
          //             return Card(
          //                 child: buildProducts()[index]
          //             );
          //           },
          //         )
          //     )
          // ),
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
                        SizedBox(width: 5,),
                        Text(
                          'đã tính thuế',
                            style: Theme.of(context).textTheme.labelSmall
                        )
                      ],
                    ),
                    Text(
                      '123213123',
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
                SizedBox(height: 10,),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: DefaultElements.black,
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 20),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero)),
                  ),
                    onPressed: () { },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Thanh toán'.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: DefaultElements.white,
                            fontSize: 20,
                            letterSpacing: 1.4
                          ),
                        ),
                        Icon(
                            Icons.arrow_forward,
                            color: DefaultElements.white,
                            size: 24,
                        )
                      ],
                    )
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
