import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: SizeConfig.screenHeight * 80 / 812,
              child: Container(
                height: SizeConfig.screenWidth,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                    color: Color(0xffe7f4eb), shape: BoxShape.circle),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: SizeConfig.screenHeight * 0.45,
                width: SizeConfig.screenWidth,
                color: Color(0xffe7f4eb),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 35 / 812,
                ),
                Icon(
                  Icons.account_circle_rounded,
                  size: SizeConfig.screenHeight * 120 / 812,
                ),
                Text(
                  'Member Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Team Member',
                  style: TextStyle(fontSize: 12, color: kTextColorGrey),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 5 / 812,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight * 5 / 812,
                    horizontal: SizeConfig.screenWidth * 25 / 375,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.screenWidth * 15 / 375),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Plant Name',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'NAMO Plant',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 14, color: kTextColorGrey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 10 / 812,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Phone Number',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                '9415012558',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 14, color: kTextColorGrey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 10 / 812,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'mandanshimpi@gmail.com',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 14, color: kTextColorGrey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 10 / 812,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Address',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                '221B Baker Street,221B Baker Street,221B Baker Street,',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 14, color: kTextColorGrey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 25 / 812,
                      left: SizeConfig.screenWidth * 25 / 375,
                      right: SizeConfig.screenWidth * 25 / 375,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.all(SizeConfig.screenWidth * 15 / 375),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Rights',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                child: Icon(
                                  Icons.edit_rounded,
                                  color: kGreen,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 10 / 812,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          SizeConfig.screenHeight * 5 / 812),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Rights'),
                                      Icon(
                                        Icons.check_box_rounded,
                                        color: kGreen,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
