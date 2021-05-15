import 'package:flutter/material.dart';
import 'package:yuvaan/BottomNavItems/People/people_one.dart';
import 'package:yuvaan/BottomNavItems/People/inventory.dart';
import 'package:yuvaan/BottomNavItems/People/status.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';

class People extends StatefulWidget {
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: kGreen),
                insets: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 25 / 375),
              ),
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    'Inventory',
                    style: TextStyle(
                        color: kGreen,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Tab(
                  child: Text(
                    'Status',
                    style: TextStyle(
                        color: kGreen,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Tab(
                  child: Text(
                    'People',
                    style: TextStyle(
                        color: kGreen,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ]),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Inventory(),
                Status(),
                PeopleOne(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
