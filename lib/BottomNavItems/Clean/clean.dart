import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvaan/Dialogs/cleanNowDB.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';

class Clean extends StatefulWidget {
  @override
  _CleanState createState() => _CleanState();
}

class _CleanState extends State<Clean> {
  bool _editMode = false;
  String dropdownValue = 'am';
  _toggleEditMode() {
    setState(() {
      _editMode = !_editMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _toggleEditMode();
        },
        backgroundColor: kGreen,
        elevation: 1,
        child: _editMode ? Icon(Icons.check_rounded) : Icon(Icons.edit_rounded),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: _editMode
                      ? SizeConfig.screenHeight * 5 / 812
                      : SizeConfig.screenHeight * 25 / 812,
                ),
                _editMode
                    ? SizedBox(
                        height: 0,
                      )
                    : SizedBox(
                        height: SizeConfig.screenHeight * 40 / 812,
                        child: MaterialButton(
                          height: SizeConfig.screenHeight * 40 / 812,
                          elevation: 0,
                          color: kGreen,
                          minWidth: SizeConfig.screenWidth * 310 / 375,
                          onPressed: () {
                            cleanNow(context);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'Clean Now',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                SizedBox(
                  height: SizeConfig.screenHeight * 20 / 812,
                ),
                _editMode
                    ? Text(
                        'Select Days',
                        style: TextStyle(
                          color: kGreen,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : Text('OR'),
                SizedBox(
                  height: SizeConfig.screenHeight * 15 / 812,
                ),
                DayWidget(
                  day: 'Monday',
                ),
                DayWidget(
                  day: 'Tuesday',
                ),
                DayWidget(
                  day: 'Wednesday',
                ),
                DayWidget(
                  day: 'Monday',
                ),
                DayWidget(
                  day: 'Monday',
                ),
                DayWidget(
                  day: 'Monday',
                ),
                DayWidget(
                  day: 'Monday',
                ),
                _editMode
                    ? Container(
                        margin: EdgeInsets.symmetric(
                            vertical: SizeConfig.screenHeight * 30 / 812),
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 15 / 375,
                          right: SizeConfig.screenWidth * 15 / 375,
                        ),
                        width: SizeConfig.screenWidth * 320 / 375,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kGreen, width: 1)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Start Time',
                                  style: TextStyle(
                                    color: kTextColorGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: [
                                    TimeTextField(),
                                    SizedBox(
                                      width: SizeConfig.screenWidth * 5 / 375,
                                    ),
                                    Text(':'),
                                    SizedBox(
                                      width: SizeConfig.screenWidth * 5 / 375,
                                    ),
                                    TimeTextField(),
                                    SizedBox(
                                      width: SizeConfig.screenWidth * 5 / 375,
                                    ),
                                    DropdownButton<String>(
                                      value: dropdownValue,
                                      icon: const Icon(
                                          Icons.arrow_drop_down_rounded),
                                      iconSize: 16,
                                      elevation: 1,
                                      underline: Container(
                                        color: Colors.transparent,
                                      ),
                                      style: TextStyle(color: kGreen),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                      },
                                      items: <String>[
                                        'am',
                                        'pm',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'End Time',
                                  style: TextStyle(
                                    color: kTextColorGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: [
                                    TimeTextField(),
                                    SizedBox(
                                      width: SizeConfig.screenWidth * 5 / 375,
                                    ),
                                    Text(':'),
                                    SizedBox(
                                      width: SizeConfig.screenWidth * 5 / 375,
                                    ),
                                    TimeTextField(),
                                    SizedBox(
                                      width: SizeConfig.screenWidth * 5 / 375,
                                    ),
                                    DropdownButton<String>(
                                      value: dropdownValue,
                                      icon: const Icon(
                                          Icons.arrow_drop_down_rounded),
                                      iconSize: 16,
                                      elevation: 1,
                                      underline: Container(
                                        color: Colors.transparent,
                                      ),
                                      style: TextStyle(color: kGreen),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                      },
                                      items: <String>[
                                        'am',
                                        'pm',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 0,
                      ),
                SizedBox(
                  height: SizeConfig.screenHeight * 20 / 812,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TimeTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 25 / 375,
      height: SizeConfig.screenWidth * 25 / 375,
      child: TextField(
        keyboardType: TextInputType.datetime,
        style: TextStyle(fontSize: 14, color: kTextColorGrey),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(
            left: SizeConfig.screenWidth * 5 / 375,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              borderSide: BorderSide(color: kTextColorGrey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              borderSide: BorderSide(color: kTextColorGrey)),
        ),
      ),
    );
  }
}

class DayWidget extends StatelessWidget {
  final String day;
  final String time;

  DayWidget({
    this.day,
    this.time = '10:00 am',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 5 / 812),
        height: SizeConfig.screenHeight * 50 / 812,
        width: SizeConfig.screenWidth * 320 / 375,
        decoration: BoxDecoration(
          color: Color(0xffF1F1F1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 15 / 375,
              ),
              child: Text(
                day,
                style: TextStyle(
                  color: kGreen,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: SizeConfig.screenWidth * 15 / 375,
              ),
              child: Text(
                time,
                style: TextStyle(
                  color: kGreen,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ));
  }
}
