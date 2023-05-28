import 'package:adidas_app/Components/listCard.dart';
import 'package:adidas_app/Models/productModel.dart';
import 'package:adidas_app/Screens/product.dart';
import 'package:adidas_app/utils/defaultElements.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List _allResult = [];
  List _researchList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    getClientStream();
    _searchController.addListener((_onSearchChanged));
    super.initState();
  }

  _onSearchChanged() {
    print(_searchController.text);
    searchResultList();
  }

  searchResultList() {
    var showResult = [];
    if (_searchController.text != "") {
      for (var clientSnapshot in _allResult) {
        var name = clientSnapshot['name'].toString().toLowerCase();
        if (name.contains(_searchController.text.toLowerCase())) {
          showResult.add(clientSnapshot);
        }
      }
    } else {
      showResult = [];
    }

    setState(() {
      _researchList = showResult;
    });
  }

  getClientStream() async {
    var data = await FirebaseFirestore.instance.collection('products').orderBy('name').get();

    setState(() {
      _allResult = data.docs;
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
    var formatter = NumberFormat.decimalPattern();

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
          title: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                hintText: "Search",
              fillColor: Colors.white,
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
              ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => null,
              icon: Icon(
                Icons.camera_alt,
                size: 25,
                color: Colors.black,
              )),
        ],
    ),
      body: Container(
        height: 280,
        child: ListView.builder(
            itemCount: _researchList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onCardPress(_researchList[index]);
                },
                child: Card(
                  child: Container(
                    width: 160,
                    color: Color.fromRGBO(236, 239, 241, 1),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(_researchList[index]['image'], width: 160, height: 150,),
                            Positioned(
                                right: 3.0,
                                top: 4.0,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: null,
                                        icon: const Icon(
                                          Icons.favorite,
                                        )
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 3),
                                    decoration: BoxDecoration(
                                      color: DefaultElements.white,
                                    ),
                                    child: Text(
                                        "\₫${formatter.format(_researchList[index]['price'])}",
                                        style: Theme.of(context).textTheme.labelSmall)),
                                Padding(
                                  padding: EdgeInsets.only(left: 7),
                                  child: Text(
                                    _researchList[index]['name'],
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
                                    capitalize(_researchList[index]['type']),
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
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
