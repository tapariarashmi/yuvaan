import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvaan/Dialogs/addTMorReplaceAdmin.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:yuvaan/Widgets/roundedSearchField.dart';

class PeopleOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        backgroundColor: kGreen,
        onPressed: () {
          addTMorReplaceAdmin(context);
        },
        child: Icon(Icons.person_add_alt_1_rounded),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 20 / 812,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedSearchField(
                hintText: 'Search by Name',
                width: 320,
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 10 / 812,
          ),
          ManagerAdminWidget(
            post: 'Manager',
            name: 'Manager Name',
            emailId: 'manager@gmail.com',
            mobile: '+91 9414505128',
          ),
          ManagerAdminWidget(
            post: 'Admin',
            name: 'Admin Name',
            emailId: 'Admin@gmail.com',
            mobile: '+91 9414505128',
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 10 / 812,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 25 / 375,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Team Members',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  'total: 20',
                  style: TextStyle(color: kTextColorGrey, fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight * 5 / 812,
                    horizontal: SizeConfig.screenWidth * 25 / 375,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 10 / 375,
                    ),
                    height: SizeConfig.screenHeight * 70 / 812,
                    decoration: BoxDecoration(
                      color: Color(0xffF1F1F1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle_rounded,
                          size: SizeConfig.screenHeight * 55 / 812,
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 15 / 375),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Team Member $index',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'email_id',
                              style: TextStyle(
                                  color: kTextColorGrey, fontSize: 12),
                            ),
                            Container(
                              child: Text(
                                '9414505128',
                                style: TextStyle(
                                    color: kTextColorGrey, fontSize: 12),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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

class ManagerAdminWidget extends StatelessWidget {
  final String post;
  final String name;
  final String emailId;
  final String mobile;

  ManagerAdminWidget({
    this.post,
    this.name,
    this.emailId,
    this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.screenHeight * 10 / 812,
        horizontal: SizeConfig.screenWidth * 25 / 375,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 5 / 812,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 10 / 375,
            ),
            height: SizeConfig.screenHeight * 75 / 812,
            decoration: BoxDecoration(
              color: kGreen10,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  size: SizeConfig.screenHeight * 60 / 812,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: kGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      emailId,
                      style: TextStyle(color: kTextColorGrey, fontSize: 12),
                    ),
                    Container(
                      child: Text(
                        mobile,
                        style: TextStyle(color: kTextColorGrey, fontSize: 12),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
