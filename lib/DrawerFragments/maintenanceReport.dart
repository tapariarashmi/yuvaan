import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:yuvaan/Widgets/roundedSearchField.dart';

class MaintenanceReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 20 / 812,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedSearchField(
                hintText: 'Search by Robot Code',
                width: 320,
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 20 / 812,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenHeight * 5 / 812,
                      horizontal: SizeConfig.screenWidth * 25 / 375,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffF1F1F1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenHeight * 15 / 812,
                          vertical: SizeConfig.screenHeight * 15 / 812),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Robot Code',
                                style: TextStyle(
                                  color: kGreen,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Issue Fixed',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
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
                    ));
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
