import 'package:dealshop/theme.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;
  final Function() onPressed;

  CustomPrimaryButton({
    required this.buttonColor,
    required this.textValue,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14.0),
      elevation: 0,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(14.0),
            child: Center(
              child: Text(
                textValue,
                style: h3bold.copyWith(color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}