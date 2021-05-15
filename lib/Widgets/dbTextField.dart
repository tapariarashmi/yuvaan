import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';

class DBTextField extends StatelessWidget {
  final String hint;
  final TextInputType keyboardType;
  final int height;
  DBTextField(
      {this.hint, this.keyboardType = TextInputType.text, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 280 / 375,
      height: SizeConfig.screenHeight * height / 812,
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Color(0xffF1F1F1),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide.none),
          hintStyle: TextStyle(fontSize: 14),
        ),
        style: TextStyle(fontSize: 14),
        cursorColor: Colors.black,
      ),
    );
  }
}
