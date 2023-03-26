import 'package:adidas_app/utils/defaultElements.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController textEditingController;
  final bool password;
  const CustomTextInput(
      {Key? key,
      required this.placeholder,
      this.password = false,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: TextField(
              controller: textEditingController,
              obscureText: password,
              enableSuggestions: !password,
              autocorrect: !password,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(width: 1, color: Color.fromRGBO(118, 118, 119, 1)),
                ),
                filled: true,
                hintStyle: TextStyle(
                    color: Color.fromRGBO(118, 118, 119, 1),

                ),
                hintText: placeholder,
                fillColor: DefaultElements.white,
                contentPadding: EdgeInsets.only(left: 10.0, top: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
