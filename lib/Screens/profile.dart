import 'package:adidas_app/Screens/login.dart';
import 'package:adidas_app/utils/defaultElements.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    onLogin() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: DefaultElements.black,
              height: 180,
              padding: EdgeInsets.fromLTRB(12, 16, 10, 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person,
                    size: 26,
                    color: DefaultElements.white,
                  ),
                  SizedBox(width: 14,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hãy cá nhân hóa'.toUpperCase(),
                        style: TextStyle(
                            color: DefaultElements.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.4
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        'Để có trải nghiệm ứng dụng phù hợp, '
                            'hãy đăng nhập \nhoặc đăng ký',
                        style: TextStyle(
                            color: DefaultElements.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2
                        ),
                      ),
                      SizedBox(height: 8,),
                      TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: DefaultElements.black,
                            padding: EdgeInsets.fromLTRB(10, 14, 10, 14),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.zero)),
                            side: BorderSide(
                                width: 1, color: DefaultElements.white),
                          ),
                          onPressed: () => onLogin(),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Đăng nhập'.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: DefaultElements.white,
                                  fontSize: 14,
                                  letterSpacing: 1.4,
                                ),
                              ),
                              SizedBox(width: 8,),
                              Icon(
                                Icons.arrow_forward,
                                color: DefaultElements.white,
                                size: 16,
                              )
                            ],
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
