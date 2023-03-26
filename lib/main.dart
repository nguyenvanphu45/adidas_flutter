import 'package:adidas_app/Screens/cart.dart';
import 'package:adidas_app/Screens/profile.dart';
import 'package:adidas_app/utils/defaultElements.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './Screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  await initialization(null);
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adidas App',
      theme: DefaultElements.getTheme(),
      home: DefaultTabController(
          initialIndex: 0,
          length: 3,
          child: Scaffold(
            body: TabBarView(
              children: [
                const HomeScreen(),
                const CartScreen(),
                const ProfileScreen()
              ],
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                  color: DefaultElements.white,
                  boxShadow: DefaultElements.cardShadow
              ),
              child: const TabBar(
                indicatorColor: Colors.transparent,
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  // Tab(icon: Icon(Icons.favorite_sharp)),
                  Tab(icon: Icon(Icons.shopping_cart)),
                  Tab(icon: Icon(Icons.person)),
                ],
              ),
            ),
          )
      ),
    );
  }
}
