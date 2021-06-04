import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:yuvaan/Widgets/robotCodeBox.dart';

class BlockViewAll extends StatelessWidget {
  final int blockIndex,startCount,endCount;
  BlockViewAll({this.blockIndex,this.endCount,this.startCount});

  @override

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          title: Text(
            'Block ${blockIndex+1}',
            style: TextStyle(
                color: Color(0xff2D2C32),
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 15 / 375,
              vertical: SizeConfig.screenHeight * 20 / 812),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: SizeConfig.screenWidth * 10 / 375,
              mainAxisSpacing: SizeConfig.screenHeight * 10 / 812,
            ),
            itemCount: endCount-startCount+1,
            itemBuilder: (context, index) => RobotCodeBox(startCount+index),
          ),
        ));
  }
}
