import 'package:adidas_app/Components/customButton.dart';
import 'package:adidas_app/Screens/register.dart';
import 'package:adidas_app/Screens/checkLogin.dart';
import 'package:adidas_app/Screens/forgorPassword.dart';
import 'package:adidas_app/provider/googleSignIn.dart';
import 'package:adidas_app/utils/Utils.dart';
import 'package:adidas_app/utils/defaultElements.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/application_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Map<String, String> data = {};

  bool? check1 = false;

  void signIn() async {
    final provider = Provider.of<ApplicationState>(
        context,
        listen: false
    );
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await provider.signIn(_emailController.text, _passwordController.text, (e) {
        Utils.showSnackBar(e.code, Colors.red);
      });

      Navigator.pop(context);

      Navigator.popUntil(context, ModalRoute.withName('/'));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      Utils.showSnackBar(e.code, Colors.red);
    }
  }

  void signInGoole() async {
    final provider = Provider.of<ApplicationState>(
        context,
        listen: false
    );

    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await provider.googleLogin();

      Navigator.pop(context);
      Navigator.popUntil(context, ModalRoute.withName('/'));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      Utils.showSnackBar(e.code, Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultElements.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: formKey,
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
                  )),
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
                            "Đăng nhập".toUpperCase(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 34,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2),
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            "Bạn quên mật khẩu ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.6,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder:
                                  (context) => ForgotPasswordScreen()
                              )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: "Email *"),
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                          ),
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: "Mật khẩu *"),
                            controller: _passwordController,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                            value != null && value.length < 6
                                ? 'Enter min 6 characters'
                                : null,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'show'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                      letterSpacing: 2),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                              //only check box
                              value: check1, //unchecked
                              onChanged: (bool? value) {
                                //value returned when checkbox is clicked
                                setState(() {
                                  check1 = value;
                                });
                              }),
                          Expanded(
                            child: RichText(
                              text: new TextSpan(
                                text: "Giữ đăng nhập cho tôi. ",
                                style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 0.5,
                                    color: Colors.black),
                                children: <TextSpan>[
                                  new TextSpan(
                                    text: "Thêm thông tin",
                                    style: new TextStyle(
                                        fontSize: 15,
                                        letterSpacing: 0.5,
                                        decoration: TextDecoration.underline),
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
                                  side: BorderSide(
                                      width: 1.0, color: Colors.black),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                ),
                                onPressed: () {},
                                child: Text(''),
                              )),
                          CustomButton(
                            text: "Đăng nhập",
                            icon: Icons.arrow_forward,
                            backgroundColor: Colors.black,
                            textColor: DefaultElements.white,
                            iconColor: DefaultElements.white,
                            onPressed: () => signIn(),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Tạo tài khoản mới?',
                            style: Theme.of(context).textTheme.titleSmall),
                        SizedBox(
                          height: 50,
                          child: TextButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()))
                            },
                            child: Text(
                              "Đăng ký",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.4,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Hoặc',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          text: 'Facebook',
                          icon: Icons.facebook_outlined,
                          backgroundColor: DefaultElements.white,
                          textColor: Colors.black,
                          iconColor: Colors.blue,
                          onPressed: () => signInGoole(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: DefaultElements.white,
                                padding: EdgeInsets.fromLTRB(10, 22, 10, 20),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.zero)),
                                side:
                                    BorderSide(width: 1, color: Colors.black)),
                            onPressed: () => signInGoole(),
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
                                Image.asset(
                                  'assets/icons/google.png',
                                  width: 24,
                                  height: 24,
                                )
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
