import 'package:adidas_app/Components/customButton.dart';
import 'package:adidas_app/utils/Utils.dart';
import 'package:adidas_app/utils/defaultElements.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  void resetPassword() async {
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
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text);

      Utils.showSnackBar('Mặt khẩu đã được gửi đến email', Colors.green);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      Utils.showSnackBar(e.code, Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Lấy lại mật khẩu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Nhập tài khoản email\nđể lấy lại mật khẩu của bạn',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
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
              SizedBox(height: 20,),
              CustomButton(
                text: "Reset Password",
                icon: Icons.mail_outlined,
                backgroundColor: Colors.black,
                textColor: DefaultElements.white,
                iconColor: DefaultElements.white,
                onPressed: () => resetPassword(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
