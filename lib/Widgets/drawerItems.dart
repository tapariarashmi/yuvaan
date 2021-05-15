import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onTap;

  DrawerItem({
    this.title,
    this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 25 / 375,
              vertical: SizeConfig.screenHeight * 5 / 812,
            ),
            child: Row(
              children: [
                Icon(
                  iconData,
                  color: Colors.black,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth * 25 / 375,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(
            color: Color(0xffe2e2e2),
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
