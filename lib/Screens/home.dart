import 'package:adidas_app/Components/cardGrid.dart';
import 'package:adidas_app/Components/createProduct.dart';
import 'package:adidas_app/Components/loader.dart';
import 'package:adidas_app/Models/productModel.dart';
import 'package:adidas_app/Screens/product.dart';
import 'package:adidas_app/utils/defaultElements.dart';
import 'package:adidas_app/utils/firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var listType = [
    'Sneakers',
    'Dép',
    'Bóng rổ',
    'Tập luyện',
    'Bóng đá',
    'Sportswear',
    'Giày thể thao khác'
  ];

  List<Widget> buildCategories() {
    return listType
        .map((e) => Container(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: DefaultElements.grey)),
                    child: Text(
                      e.toUpperCase(),
                      style:
                          TextStyle(color: DefaultElements.grey, fontSize: 14),
                    ),
                  )
                ],
              ),
            ))
        .toList();
  }

  Future<List<Product>>? products;

  @override
  void initState() {
    super.initState();
    products = FirestoreUtil.getProducts([]);
  }

  @override
  Widget build(BuildContext context) {
    onCardPress(Product product) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductScreen(
                    product: product,
                  )
          )
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'ĐỢT PHÁT HÀNH',
        ),
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateProduct()));
                    },
                    icon: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.black,
                    )),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.search,
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: SizedBox(
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: buildCategories(),
                    ),
                  ),
                ),
                FutureBuilder<List<Product>>(
                    future: products,
                    builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return Column(
                          children: [
                            GridView.builder(
                                itemCount: snapshot.data?.length,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 330.0,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return CardGrid(
                                      product: snapshot.data![index],
                                      index: index,
                                      onPress: () {
                                        onCardPress(snapshot.data![index]);
                                      });
                                }),
                          ],
                        );
                      } else {
                        return Loader();
                      }
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
