import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';

class RobotStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: Text(
          'Robot 1121 : B1',
          style: TextStyle(
              color: Color(0xff2D2C32),
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 15 / 375,
                vertical: SizeConfig.screenHeight * 15 / 812),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cleaning Status',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 5 / 812,
                ),
                Text(
                  'Completed',
                  style: TextStyle(
                    color: kGreen,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 5 / 812,
                ),
                Text(
                  'Start Time: 10:15 am     -     End Time: 12:15 pm',
                  style: TextStyle(
                    color: kTextColorGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: kTextColorGrey,
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 15 / 375,
                vertical: SizeConfig.screenHeight * 15 / 812),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Battery Status',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 5 / 812,
                ),
                Text(
                  'Battery charge: 55%',
                  style: TextStyle(
                    color: kTextColorGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 5 / 812,
                ),
                Row(
                  children: [
                    Text(
                      'Status: ',
                      style: TextStyle(
                        color: kTextColorGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Charging',
                      style: TextStyle(
                        color: kGreen,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 5 / 812,
                ),
                Text(
                  'Battery health: 55%',
                  style: TextStyle(
                    color: kTextColorGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: kTextColorGrey,
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 15 / 375,
                vertical: SizeConfig.screenHeight * 15 / 812),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Device History',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 5 / 812,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Date',
                        style: TextStyle(
                          color: kGreen,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Start Time',
                        style: TextStyle(
                          color: kGreen,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'End Time',
                        style: TextStyle(
                          color: kGreen,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return DeviceHistoryWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DeviceHistoryNotCleanedWidget extends StatelessWidget {
  const DeviceHistoryNotCleanedWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 15 / 375,
          vertical: SizeConfig.screenHeight * 10 / 812),
      child: Column(
        children: [
          Container(
            color: Color(0x1aF29339),
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 5 / 812,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'DD/MM/YYYY',
                        style: TextStyle(
                          color: kTextColorGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '10:21 am',
                        style: TextStyle(
                          color: kTextColorGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '12:20 pm',
                        style: TextStyle(
                          color: kTextColorGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 10 / 812,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.error,
                      color: Color(0xffF29339),
                      size: SizeConfig.screenHeight * 15 / 812,
                    ),
                    Text(
                      '  Not Cleaned:  ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xffF29339),
                      ),
                    ),
                    Text(
                      'Not Cleaned:  ',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: kTextColorGrey),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 5 / 812,
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 5 / 812,
          ),
          Divider(
            color: kTextColorGrey,
            thickness: 0.2,
          ),
        ],
      ),
    );
  }
}

class DeviceHistoryWidget extends StatelessWidget {
  const DeviceHistoryWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 15 / 375,
          vertical: SizeConfig.screenHeight * 10 / 812),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'DD/MM/YYYY',
                  style: TextStyle(
                    color: kTextColorGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '10:21 am',
                  style: TextStyle(
                    color: kTextColorGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '12:20 pm',
                  style: TextStyle(
                    color: kTextColorGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: kTextColorGrey,
            thickness: 0.2,
          ),
        ],
      ),
    );
  }
}
