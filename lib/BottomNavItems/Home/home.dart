import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yuvaan/BottomNavItems/Home/blockViewAll.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:yuvaan/Widgets/robotCodeBox.dart';
import 'package:yuvaan/Widgets/roundedSearchField.dart';

class Home extends StatelessWidget {
  final List<Widget> imageSliders = [
    Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.asset('assets/images/panels_cleaned.png', fit: BoxFit.cover),
            Positioned(
              top: SizeConfig.screenHeight * 20 / 812,
              left: SizeConfig.screenWidth * 30 / 375,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '12345+',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'Panels cleaned',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset('assets/images/no_of_robots.png', fit: BoxFit.cover),
              Positioned(
                top: SizeConfig.screenHeight * 20 / 812,
                left: SizeConfig.screenWidth * 30 / 375,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '900',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'Number of Robots',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              )
            ],
          )),
    ),
    Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset('assets/images/water_saved.png', fit: BoxFit.cover),
              Positioned(
                top: SizeConfig.screenHeight * 20 / 812,
                left: SizeConfig.screenWidth * 30 / 375,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '365L',
                      style: TextStyle(
                          color: Color(0xff2F81B1),
                          fontSize: 26,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'Water Saved',
                      style: TextStyle(
                          color: Color(0xff2F81B1),
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              )
            ],
          )),
    ),
    Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset('assets/images/energy_increased.png',
                  fit: BoxFit.cover),
              Positioned(
                top: SizeConfig.screenHeight * 20 / 812,
                left: SizeConfig.screenWidth * 30 / 375,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '10 MW',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'Energy Increased',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              )
            ],
          )),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 10 / 812,
          ),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 327 / 88,
            ),
            items: imageSliders,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 10 / 812,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedSearchField(
                hintText: 'Search by Robot Code',
                width: 285,
              ),
              Container(
                height: SizeConfig.screenHeight * 40 / 812,
                width: SizeConfig.screenHeight * 40 / 812,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kGreen,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.filter_list_rounded,
                    color: kGreen,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 10 / 812,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 15 / 375,
                        vertical: SizeConfig.screenHeight * 10 / 812,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Block $index',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlockViewAll(),
                                ),
                              );
                            },
                            child: Container(
                              height: SizeConfig.screenHeight * 20 / 812,
                              width: SizeConfig.screenHeight * 60 / 812,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: Center(
                                child: Text(
                                  'View All',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RobotCodeBox(),
                        RobotCodeBox(),
                        RobotCodeBox(),
                        RobotCodeBox(),
                        RobotCodeBox(),
                        RobotCodeBox(),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 10 / 812,
                    ),
                    Divider(
                      color: Color(0xffe2e2e2),
                      thickness: 0.5,
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 10 / 812,
          ),
        ],
      ),
    );
  }
}
