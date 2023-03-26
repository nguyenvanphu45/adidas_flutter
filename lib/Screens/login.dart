import 'package:adidas_app/Components/customButton.dart';
import 'package:adidas_app/Components/customTextInput.dart';
import 'package:adidas_app/utils/defaultElements.dart';
import 'package:adidas_app/utils/loginData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Map<String, String> data = {};

  bool? check1 = false;

  _LoginScreenState() {
    data = LoginData.signIn;
  }

  void switchLogin() {
    setState(() {
      if (mapEquals(data, LoginData.signUp)) {
        data = LoginData.signIn;
      } else {
        data = LoginData.signUp;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultElements.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                right: 8.0,
                top: 12.0,
                child: IconButton(
                  icon: const Icon(
                    Icons.clear,
                    size: 34,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          (data["heading"] as String).toUpperCase(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2
                          ),
                        ),
                      ),
                      // Text(
                      //   data['subHeading'] as String,
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w500,
                      //     letterSpacing: 1.6,
                      //     decoration: TextDecoration.underline
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(height: 10,),
                  model(data, _emailController, _passwordController),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox( //only check box
                            value: check1, //unchecked
                            onChanged: (bool? value){
                              //value returned when checkbox is clicked
                              setState(() {
                                check1 = value;
                              });
                            }
                        ),
                        Expanded(
                          child: RichText(
                            text: new TextSpan(
                              text: data["label"] as String,
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 0.5,
                                color: Colors.black
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                  text: data["labelHint"] as String,
                                  style: new TextStyle(
                                      fontSize: 15,
                                      letterSpacing: 0.5,
                                      decoration: TextDecoration.underline
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            bottom: -5,
                            right: -5,
                            width: MediaQuery.of(context).size.width - 40,
                            height: 52,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: BorderSide(width: 1.0, color: Colors.black),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              onPressed: () {  },
                              child: Text(''),
                            )
                        ),
                        CustomButton(
                          text: data['button'] as String,
                          icon: Icons.arrow_forward,
                          backgroundColor: Colors.black,
                          textColor: DefaultElements.white,
                          iconColor: DefaultElements.white,
                        )
                        // TextButton(
                        //     style: TextButton.styleFrom(
                        //       backgroundColor: DefaultElements.black,
                        //       padding: EdgeInsets.fromLTRB(10, 22, 10, 20),
                        //       shape: const RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.all(Radius.zero)
                        //       ),
                        //     ),
                        //     onPressed: () { },
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text(
                        //           (data['button'] as String).toUpperCase(),
                        //           style: TextStyle(
                        //               fontWeight: FontWeight.w600,
                        //               color: DefaultElements.white,
                        //               fontSize: 20,
                        //               letterSpacing: 1.4
                        //           ),
                        //         ),
                        //         Icon(
                        //           Icons.arrow_forward,
                        //           color: DefaultElements.white,
                        //           size: 24,
                        //         )
                        //       ],
                        //     )
                        // ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        child: TextButton(
                          onPressed: switchLogin,
                          child: Text(
                            data["footer"] as String,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text('Hoặc', style: Theme.of(context).textTheme.titleMedium,),
                      SizedBox(height: 10,),
                      CustomButton(
                          text: 'Facebook',
                          icon: Icons.facebook_outlined,
                          backgroundColor: DefaultElements.white,
                          textColor: Colors.black,
                          iconColor: Colors.blue
                      ),
                      SizedBox(height: 10,),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: DefaultElements.white,
                              padding: EdgeInsets.fromLTRB(10, 22, 10, 20),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.zero)
                              ),
                              side: BorderSide(
                                  width: 1,
                                  color: Colors.black
                              )
                          ),
                          onPressed: () { },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Google'.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 18,
                                  letterSpacing: 1.8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Image.asset('assets/icons/google.png',
                                width: 24,
                                height: 24,
                              )
                            ],
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  model(Map<String, String> data, TextEditingController emailController,
      TextEditingController passwordController) {
    return Container(
      child: Column(
        children: [
          CustomTextInput(
              placeholder: "Email *",
              textEditingController: _emailController
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.remove_red_eye_outlined,
                  size: 16,
                ),
                SizedBox(width: 5,),
                Text(
                  'show'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    letterSpacing: 2
                  ),
                )
              ],
            ),
          ),
          CustomTextInput(
              placeholder: "Mật khẩu *",
              textEditingController: _passwordController
          ),
        ],
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim()
    );
  }
}
