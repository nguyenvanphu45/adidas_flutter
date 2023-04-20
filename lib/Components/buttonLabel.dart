import 'package:adidas_app/utils/defaultElements.dart';
import 'package:flutter/material.dart';

class ButtonLabel extends StatelessWidget {
  final String text;
  final String? subText;
  final IconData icon;
  final VoidCallback onPressed;
  const ButtonLabel(
      {Key? key,
      required this.text,
      this.subText,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(141, 140, 140, 1)))),
      child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (subText == '')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text.toUpperCase(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                          color: Colors.black),
                    ),
                  ],
                )
              else
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text.toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                            color: Colors.black),
                      ),
                      Text(
                        subText!,
                        style:
                            TextStyle(
                              fontSize: 12,
                                letterSpacing: 1.5,
                                color: Colors.grey
                            ),
                      )
                    ],
                  ),
                ),
              Icon(
                icon,
                color: Colors.black,
              )
            ],
          )),
    );
  }
}
