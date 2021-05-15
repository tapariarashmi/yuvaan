import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yuvaan/Dialogs/addComment.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:yuvaan/Widgets/roundedSearchField.dart';

class Status extends StatelessWidget {
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedSearchField(
                hintText: 'Search by Robot Code',
                width: 285,
              ),
              InkWell(
                onTap: () {
                  //Todo:
                },
                child: FaIcon(
                  FontAwesomeIcons.fileDownload,
                  size: SizeConfig.screenHeight * 20 / 812,
                  color: kGreen,
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 20 / 812,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 25 / 375),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pending',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Total: 8',
                  style: TextStyle(fontSize: 14, color: kTextColorGrey),
                ),
              ],
            ),
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
                          horizontal: SizeConfig.screenWidth * 15 / 375,
                          vertical: SizeConfig.screenHeight * 12 / 812),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
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
                                  'Global Warming and Facial Acne are two big world problems, the latter problem has no solution yet, unfortunately',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        addComment(context);
                                      },
                                      child: FaIcon(
                                        FontAwesomeIcons.commentDots,
                                        size:
                                            SizeConfig.screenHeight * 18 / 812,
                                        color: kGreen,
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            SizeConfig.screenWidth * 20 / 375),
                                    Icon(
                                      Icons.check_box_outlined,
                                      color: kGreen,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight * 5 / 812,
                                ),
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
                            ),
                          )
                        ],
                      ),
                    ));
              },
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 30 / 812,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 25 / 375),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Resolved',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Total: 8',
                  style: TextStyle(fontSize: 14, color: kTextColorGrey),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
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
                          horizontal: SizeConfig.screenWidth * 15 / 375,
                          vertical: SizeConfig.screenHeight * 12 / 812),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
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
                                  'Motor not working',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
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
                            ),
                          )
                        ],
                      ),
                    ));
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
