import 'package:adidas_app/Components/buttonLabel.dart';
import 'package:adidas_app/Components/customButton.dart';
import 'package:adidas_app/provider/googleSignIn.dart';
import 'package:adidas_app/utils/defaultElements.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {
  final String user;
  const Setting({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Cài đặt'.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    letterSpacing: 1.5
                  ),
                ),
                SizedBox(height: 10,),
                ButtonLabel(
                  text: 'Quốc gia & ngôn ngữ',
                  subText: '',
                  icon: Icons.arrow_forward_ios_rounded,
                  onPressed: () {},
                ),
                SizedBox(height: 10,),
                ButtonLabel(
                  text: 'Thông báo',
                  subText: '',
                  icon: Icons.arrow_forward_ios_rounded,
                  onPressed: () {},
                ),
                SizedBox(height: 10,),
                ButtonLabel(
                  text: 'Tự động phát video trên bài đăng',
                  subText: 'Video sẽ tự động phát trên màn hình, việc này có '
                      'thể sử dụng một lượng dữ liệu điện thoại của bạn',
                  icon: Icons.arrow_forward_ios_rounded,
                  onPressed: () {},
                ),
                SizedBox(height: 10,),
                ButtonLabel(
                  text: 'Quản lý tài khoản',
                  subText: '',
                  icon: Icons.arrow_forward_ios_rounded,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 40,),
          CustomButton(
            text: "Đăng xuất",
            icon: Icons.arrow_forward,
            backgroundColor: Colors.black,
            textColor: DefaultElements.white,
            iconColor: DefaultElements.white,
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(
                  context,
                  listen: false
              );
             (user == "({google.com})") ?
                provider.logout() :
                FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
    );
  }
}
