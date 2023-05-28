import 'package:adidas_app/Components/question.dart';
import 'package:adidas_app/Components/rating.dart';
import 'package:adidas_app/Models/productModel.dart';
import 'package:adidas_app/utils/Utils.dart';
import 'package:adidas_app/utils/defaultElements.dart';
import 'package:adidas_app/utils/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../utils/application_state.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  bool addButtonLoad = false;

  List<String> listSize = ["3.5 UK", "4 UK", "4.5 UK", "5 UK", "5.5 UK", "6 UK",
    "6.5 UK", "7 UK", "7.5 UK", "8 UK"];

  void onAddToCart() async {
    setState(() {
      addButtonLoad = true;
    });
    try {
      await FirestoreUtil.addToCart(
          Provider
              .of<ApplicationState>(context, listen: false)
              .user,
          widget.product.id
      );
      Utils.showSnackBar('Đã thêm vào giỏ'
          , Colors.green);
    } catch(e) {
      Utils.showSnackBar(e.toString(), Colors.red);
    }
    setState(() {
      addButtonLoad = false;
    });
  }

  onBackHome() {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.decimalPattern();

    return Scaffold(
        body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    // bottom: PreferredSize(
                    //   preferredSize: Size.fromHeight(0),
                    //   child: Container(
                    //     padding: EdgeInsets.fromLTRB(20, 24, 20, 24),
                    //     decoration: BoxDecoration(
                    //         border: Border(
                    //             bottom: BorderSide(
                    //                 color: Color.fromRGBO(211, 215, 218, 1),
                    //                 width: 1
                    //             )
                    //         )
                    //     ),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(widget.product.name.toUpperCase(),
                    //             style: TextStyle(
                    //                 fontSize: 26,
                    //                 fontWeight: FontWeight.w600,
                    //                 letterSpacing: 1.8)),
                    //         SizedBox(
                    //           height: 10,
                    //         ),
                    //         Row(
                    //           children: [
                    //             Text(
                    //               "\₫${_formatNumber(
                    //                   widget.product.price.replaceAll('.', '')
                    //               )}",
                    //               style: Theme.of(context).textTheme.titleSmall,
                    //             ),
                    //             SizedBox(
                    //               width: 16,
                    //             ),
                    //             Text(
                    //               widget.product.type,
                    //               style: TextStyle(
                    //                   fontSize: 12,
                    //                   letterSpacing: 1.8,
                    //                   color: DefaultElements.grey),
                    //             )
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    pinned: true,
                    expandedHeight: 300,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        widget.product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 24, 20, 24),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color.fromRGBO(211, 215, 218, 1),
                                              width: 1
                                          )
                                      )
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.product.name.toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.8)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "\₫${formatter.format(widget.product.price)}",
                                            style: Theme.of(context).textTheme.titleSmall,
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            widget.product.type,
                                            style: TextStyle(
                                                fontSize: 12,
                                                letterSpacing: 1.8,
                                                color: DefaultElements.grey),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    right: 12.0,
                                    top: 12.0,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.share,
                                        size: 24,
                                      ),
                                      onPressed: () => null,
                                    )),
                              ],
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          color: Color.fromRGBO(211, 215, 218, 1),
                                          width: 1,
                                        )
                                    )
                                ),
                                padding: EdgeInsets.fromLTRB(20, 24, 20, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Kích cỡ',
                                          style: Theme.of(context).textTheme.labelSmall,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black12)),
                                          child: Image(
                                            image: AssetImage('assets/icons/ruler.png'),
                                            width: 20,
                                            height: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    SizedBox(
                                      height: 60.0,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: listSize.map((size){
                                          return Container(
                                              width: 80,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                size,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500
                                                ),
                                              )
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 24, 20, 24),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color.fromRGBO(211, 215, 218, 1),
                                          width: 1
                                      )
                                  )
                              ),
                              child: Column(
                                children: [
                                  OutlinedButton(
                                    onPressed: onAddToCart,
                                    style: OutlinedButton.styleFrom(
                                      side:
                                      BorderSide(width: 0.5, color: DefaultElements.black),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero),
                                      padding: EdgeInsets.fromLTRB(12, 18, 12, 16),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Thêm vào giỏ'.toUpperCase(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: DefaultElements.black,
                                              fontSize: 12,
                                              letterSpacing: 3),
                                        ),
                                        Icon(
                                          Icons.add_shopping_cart,
                                          color: DefaultElements.black,
                                          size: 24,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: DefaultElements.black,
                                        padding: EdgeInsets.fromLTRB(12, 18, 12, 16),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.zero)),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Mua Ngay'.toUpperCase(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: DefaultElements.white,
                                                fontSize: 12,
                                                letterSpacing: 3),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: DefaultElements.white,
                                            size: 24,
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage('assets/icons/cash.png'),
                                          width: 36,
                                          height: 32,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Image(
                                          image: AssetImage('assets/icons/card.png'),
                                          width: 30,
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 24, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.product.description,
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.3
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    widget.product.subDescription,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 24, 20, 0),
                              child: Rating(),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 24, 20, 0),
                              child: Question(),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ]
                      )
                    ]),
                  )
                ],
              )
            ]
        )
    );
  }
}