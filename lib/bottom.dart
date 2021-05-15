import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yuvaan/BottomNavItems/Clean/clean.dart';
import 'package:yuvaan/BottomNavItems/Home/home.dart';
import 'package:yuvaan/BottomNavItems/People/people.dart';
import 'package:yuvaan/DrawerFragments/aboutPlant.dart';
import 'package:yuvaan/DrawerFragments/actionList.dart';
import 'package:yuvaan/DrawerFragments/help.dart';
import 'package:yuvaan/DrawerFragments/maintenanceReport.dart';
import 'package:yuvaan/DrawerFragments/monthlyReport.dart';
import 'package:yuvaan/DrawerFragments/robotDetails.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:yuvaan/Widgets/drawerItems.dart';
import 'Profile/profile.dart';

class BottomItems extends StatefulWidget {
  @override
  _BottomItemsState createState() => _BottomItemsState();
}

class _BottomItemsState extends State<BottomItems> {
  int _currentIndex = 0;
  List<Widget> _bottomNavScreens;

  String setAppBarTitle(int index) {
    if (index == 0) return 'Plant Name';
    if (index == 1) return 'Clean';
    if (index == 2) return 'People';
    if (index == 3) return 'About Plant';
    if (index == 4) return 'Robot Details';
    if (index == 5) return 'Monthly Report';
    if (index == 6) return 'Action List';
    if (index == 7) return 'Maintenance Report';
    if (index == 8) return 'Help';
    if (index == 9)
      return 'Profile';
    else
      return ' ';
  }

  @override
  void initState() {
    
    super.initState();
    _bottomNavScreens = [
      Home(),
      Clean(),
      People(),
      AboutPlant(),
      RobotDetails(),
      MonthlyReport(),
      ActionList(),
      MaintenanceReport(),
      Help(),
      Profile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            setAppBarTitle(_currentIndex),
            style: TextStyle(
                color: Color(0xff2D2C32),
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_none_rounded,
                color: kGreen,
              ),
              onPressed: () {
                //todo:
              },
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle_rounded,
                color: Color(0xff2D2C32),
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 9;
                });
              },
            )
          ],
        ),
        drawer: Drawer(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.screenHeight * 50 / 812,
                  left: SizeConfig.screenWidth * 15 / 375,
                  bottom: SizeConfig.screenHeight * 20 / 812,
                  right: SizeConfig.screenWidth * 5 / 375,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 60,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 10 / 375),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Name',
                          style: TextStyle(
                              color: kGreen,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text('Role'),
                        Container(
                          width: SizeConfig.screenWidth * 175 / 375,
                          child: Text(
                            'mandanshubham@gmail.com',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                color: kGreen,
                thickness: 1,
              ),
              DrawerItem(
                title: 'About Plant',
                iconData: Icons.info_outline_rounded,
                onTap: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                },
              ),
              DrawerItem(
                title: 'Robot Details',
                iconData: Icons.android,
                onTap: () {
                  setState(() {
                    _currentIndex = 4;
                  });
                },
              ),
              DrawerItem(
                title: 'Monthly Report',
                iconData: Icons.calendar_today_rounded,
                onTap: () {
                  setState(() {
                    _currentIndex = 5;
                  });
                },
              ),
              DrawerItem(
                title: 'Action List',
                iconData: Icons.list_alt_rounded,
                onTap: () {
                  setState(() {
                    _currentIndex = 6;
                  });
                },
              ),
              DrawerItem(
                title: 'Maintenance Report',
                iconData: Icons.handyman_rounded,
                onTap: () {
                  setState(() {
                    _currentIndex = 7;
                  });
                },
              ),
              DrawerItem(
                title: 'Help',
                iconData: Icons.help_outline_rounded,
                onTap: () {
                  setState(() {
                    _currentIndex = 8;
                  });
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      onTap: () {}),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) => setState(() => _currentIndex = index),
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.home_rounded),
              title: Text(
                'Home',
                style: TextStyle(color: kGreen),
              ),
              inactiveColor: kTextColorGrey,
              activeColor: kGreen10,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.cleaning_services_rounded),
              title: Text(
                'Clean',
                style: TextStyle(color: kGreen),
              ),
              inactiveColor: kTextColorGrey,
              activeColor: kGreen10,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: FaIcon(
                FontAwesomeIcons.users,
                size: SizeConfig.screenHeight * 18 / 812,
              ),
              title: Text(
                'People',
                style: TextStyle(color: kGreen),
              ),
              inactiveColor: kTextColorGrey,
              activeColor: kGreen10,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        body: _bottomNavScreens[_currentIndex]);
  }
}
