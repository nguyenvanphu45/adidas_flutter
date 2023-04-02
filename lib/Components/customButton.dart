import 'package:adidas_app/utils/defaultElements.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final VoidCallback onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: EdgeInsets.fromLTRB(10, 22, 10, 20),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero)
            ),
            side: BorderSide(
              width: 1,
              color: Colors.black
            )
          ),
          onPressed: onPressed,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (text).toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: textColor,
                    fontSize: 18,
                    letterSpacing: 1.8,
                ),
                textAlign: TextAlign.center,
              ),
              Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ],
          )
      ),
    );
  }
}
