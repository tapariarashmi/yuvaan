import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';

class RoundedSearchField extends StatelessWidget {
  final String hintText;
  final int width;

  RoundedSearchField({this.hintText, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * width / 375,
      height: SizeConfig.screenHeight * 40 / 812,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.only(top: 5),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: kGreen,
            size: 20,
          ),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
              borderSide: BorderSide(color: kGreen)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
              borderSide: BorderSide(color: kGreen)),
          hintStyle: TextStyle(fontSize: 14),
        ),
        style: TextStyle(fontSize: 14),
        cursorColor: Colors.black,
      ),
    );
  }
}
