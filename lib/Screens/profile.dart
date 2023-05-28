import 'dart:math';

import 'package:adidas_app/Components/profiles/account.dart';
import 'package:adidas_app/Components/profiles/setting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    String generateRandomString(int len) {
      var r = Random();
      const _chars = '0123456789';
      return '@user' + List.generate(
          len, (index) => _chars[r.nextInt(_chars.length)]
      ).join();
    }

    final providerData = user.providerData.map((e) => {
      e.providerId
    }).toString();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                user.photoURL != null
                    ? Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage('${user.photoURL}'),
                            fit: BoxFit.cover
                          )
                        ),
                    )
                    : Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.black),
                      ),
                      child: Icon(
                          Icons.person,
                          size: 40,
                        )
                    ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          user.displayName != null
                              ? '${user.displayName}'
                              : generateRandomString(10),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.5
                          ),
                        ),
                        SizedBox(width: 8,),
                        Icon(
                          Icons.edit,
                          size: 18,
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.badge,
                          size: 16,
                        ),
                        SizedBox(width: 8,),
                        Text(
                          'Thẻ adiclub của tôi'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.4
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          bottom: TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              labelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600
              ),
              tabs: [
                Tab(
                  text: 'Tài khoản'.toUpperCase(),
                ),
                Tab(
                    text: 'Đơn hàng'.toUpperCase()
                ),
                Tab(
                    text: 'Cài đặt'.toUpperCase()
                ),
              ]
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                    children: [
                      Account(),
                      Center(child: Text('${user}'),),
                      Setting(user: providerData),
                    ]
                ),
              ),
            )),
      ),
    );
  }
}
