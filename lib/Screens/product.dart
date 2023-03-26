import 'package:adidas_app/utils/data.dart';
import 'package:adidas_app/Screens/home.dart';
import 'package:adidas_app/utils/defaultElements.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool addButtonLoad = false;

  List<Map> listSize = [
    {'name': '3.5 UK'},
    {'name': '4 UK'},
    {'name': '4.5 UK'},
    {'name': '5 UK'},
    {'name': '5.5 UK'},
    {'name': '6 UK'},
    {'name': '6.5 UK'},
    {'name': '7 UK'},
    {'name': '7.5 UK'},
    {'name': '8 UK'},
  ];

  void onAddToCart() async {
    setState(() {
      addButtonLoad = true;
    });

    setState(() {
      addButtonLoad = false;
    });
  }

  onBackHome() {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(children: [
                // SizedBox(
                //   height: 300,
                //   width: double.infinity,
                //   child: Image.network(
                //     e.image,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Positioned(
                    right: 8.0,
                    top: 12.0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.clear,
                        size: 30,
                      ),
                      onPressed: () => onBackHome(),
                    )),
              ]),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 24, 20, 24),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Color.fromRGBO(211, 215, 218, 1),
                      width: 1,
                    ))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Giày Stan Smith'.toUpperCase(),
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
                              "\đ 2.200.000",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Men\'s Shoes',
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
                        onPressed: () => onBackHome(),
                      )),
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Color.fromRGBO(211, 215, 218, 1),
                    width: 1,
                  ))),
                  padding: EdgeInsets.fromLTRB(20, 24, 20, 24),
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
                      // SizedBox(
                      //   height: 100.0,
                      //   child: ListView.builder(
                      //     physics: ClampingScrollPhysics(),
                      //     scrollDirection: Axis.horizontal,
                      //     padding: EdgeInsets.only(
                      //       right: 10
                      //     ),
                      //     itemCount: 15,
                      //     itemBuilder: (BuildContext context, int index) => Card(
                      //       child: Center(child: Text('Dummy Card Text')),
                      //     ),
                      //   ),
                      // ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(20, 24, 20, 24),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Color.fromRGBO(211, 215, 218, 1),
                  width: 1,
                ))),
                child: Column(
                  children: [
                    OutlinedButton(
                      onPressed: null,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 0.5, color: DefaultElements.black),
                        shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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
                height: 100,
              )
            ])
          ]),
    ));
  }
}
