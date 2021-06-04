import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  AppButton({this.buttonText,this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(buttonText),
          ),
        ),
        decoration: BoxDecoration(
          color: kGreen,
          borderRadius: BorderRadius.circular(1)
        ),
      ),
    );
  }
}
