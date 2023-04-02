import 'package:adidas_app/Components/customButton.dart';
import 'package:adidas_app/utils/defaultElements.dart';
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

    return SafeArea(
        child: Column(
          children: [
            Text(user.email!),
            SizedBox(height: 30,),
            CustomButton(
              text: 'Đăng xuất',
              icon: Icons.arrow_forward,
              backgroundColor: Colors.black,
              textColor: DefaultElements.white,
              iconColor: DefaultElements.white,
              onPressed: () => FirebaseAuth.instance.signOut()
            )
          ],
        )
    );
  }
}
