import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';

class MonthlyReport extends StatefulWidget {
  @override
  _MonthlyReportState createState() => _MonthlyReportState();
}

class _MonthlyReportState extends State<MonthlyReport> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                  weekdayStyle: TextStyle(color: kTextColorGrey),
                  weekendStyle: TextStyle(color: kGreen),
                  canEventMarkersOverflow: true,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.blue)),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                centerHeaderTitle: true,
                titleTextStyle: TextStyle(
                  color: kGreen,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.sunday,
              builders: CalendarBuilders(
                dayBuilder: (context, date, events) => Container(
                  margin: EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.cloudShowersHeavy,
                            size: SizeConfig.screenHeight * 10 / 812,
                            color: kLightBlue,
                          ),
                        ],
                      ),
                      Text(
                        date.day.toString(),
                        style: TextStyle(color: kGreen),
                      ),
                      Text(
                        '50%',
                        style: TextStyle(
                            fontSize: SizeConfig.screenHeight * 12 / 812),
                      ),
                    ],
                  ),
                ),
                weekendDayBuilder: (context, date, events) => Container(
                  margin: EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kGreen10,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.battery_alert,
                            color: kRed,
                            size: SizeConfig.screenHeight * 12 / 812,
                          ),
                        ],
                      ),
                      Text(
                        date.day.toString(),
                        style: TextStyle(color: kGreen),
                      ),
                      Text(
                        '50%',
                        style: TextStyle(
                            fontSize: SizeConfig.screenHeight * 12 / 812),
                      ),
                    ],
                  ),
                ),
                selectedDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kGreen,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.battery_alert,
                            color: kRed,
                            size: SizeConfig.screenHeight * 12 / 812,
                          ),
                        ],
                      ),
                      Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '64%',
                        style: TextStyle(
                            fontSize: SizeConfig.screenHeight * 12 / 812),
                      ),
                    ],
                  ),
                ),
                todayDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffF1F1F1),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.battery_alert,
                            color: kRed,
                            size: SizeConfig.screenHeight * 12 / 812,
                          ),
                        ],
                      ),
                      Text(
                        date.day.toString(),
                        style: TextStyle(color: kTextColorGrey),
                      ),
                      Text(
                        '100%',
                        style: TextStyle(
                            fontSize: SizeConfig.screenHeight * 12 / 812),
                      ),
                    ],
                  ),
                ),
                dowWeekendBuilder: (context, day) => Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kGreen10,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      color: kGreen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                dowWeekdayBuilder: (context, day) => Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xfff1f1f1),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      color: kTextColorGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              calendarController: _controller,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 40 / 812,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 20 / 375),
              child: Material(
                elevation: 2,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: SizeConfig.screenHeight * 60 / 812,
                        width: SizeConfig.screenWidth * 60 / 375,
                        decoration: BoxDecoration(
                          color: kGreen10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '2',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'March',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth * 25 / 375,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '70%',
                                style: TextStyle(
                                    color: kGreen,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth * 10 / 375,
                              ),
                              Text(
                                'Cleaned',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kGreen),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.wind,
                                size: SizeConfig.screenHeight * 18 / 812,
                                color: kBlue,
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth * 10 / 375,
                              ),
                              Text(
                                'High Speed Winds',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kBlue),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 40 / 812,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 20 / 375),
              child: Material(
                elevation: 2,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.cancel_outlined,
                                  color: kOrange,
                                  size: SizeConfig.screenHeight * 20 / 812,
                                ),
                                SizedBox(
                                  width: SizeConfig.screenWidth * 5 / 375,
                                ),
                                Text(
                                  'Not Scheduled',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: kOrange),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.battery_alert,
                                  color: kRed,
                                  size: SizeConfig.screenHeight * 20 / 812,
                                ),
                                SizedBox(
                                  width: SizeConfig.screenWidth * 5 / 375,
                                ),
                                Text(
                                  'Battery Not Charged',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: kRed),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 10 / 812,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.wind,
                                  size: SizeConfig.screenHeight * 18 / 812,
                                  color: kBlue,
                                ),
                                SizedBox(
                                  width: SizeConfig.screenWidth * 5 / 375,
                                ),
                                Text(
                                  'High Speed Winds',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: kBlue),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.cloudShowersHeavy,
                                  size: SizeConfig.screenHeight * 18 / 812,
                                  color: kLightBlue,
                                ),
                                SizedBox(
                                  width: SizeConfig.screenWidth * 5 / 375,
                                ),
                                Text(
                                  'Heavy Rain',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: kLightBlue),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 40 / 812,
            ),
          ],
        ),
      ),
    );
  }
}
