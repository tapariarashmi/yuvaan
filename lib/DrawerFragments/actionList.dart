import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:yuvaan/Widgets/roundedSearchField.dart';

class ActionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 20 / 812,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedSearchField(
                hintText: 'Search by Name/Position',
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
            height: SizeConfig.screenHeight * 20 / 812,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight * 5 / 812,
                    left: SizeConfig.screenWidth * 15 / 375,
                    bottom: SizeConfig.screenHeight * 5 / 812,
                    right: SizeConfig.screenWidth * 15 / 375,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            size: SizeConfig.screenHeight * 45 / 812,
                          ),
                          SizedBox(width: SizeConfig.screenWidth * 10 / 375),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shubham Mandan',
                                style: TextStyle(
                                    color: kGreen,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Role',
                                style: TextStyle(
                                    color: kTextColorGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight * 8 / 812,
                              ),
                              Container(
                                width: SizeConfig.screenWidth * 240 / 375,
                                child: Text(
                                  'Action Action Action Action Action Action Action Action Action',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '10/03/2021',
                                style: TextStyle(
                                  color: kTextColorGrey,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                '12:10 am',
                                style: TextStyle(
                                  color: kTextColorGrey,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Divider(
                        color: Color(0xffe2e2e2),
                        thickness: 0.5,
                        indent: SizeConfig.screenWidth * 5 / 375,
                        endIndent: SizeConfig.screenWidth * 5 / 375,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 10 / 812,
          )
        ],
      ),
    );
  }
}
