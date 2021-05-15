import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvaan/Dialogs/addNewPart.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:yuvaan/Widgets/roundedSearchField.dart';

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  bool _editMode = false;

  toggleEditMode() {
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
          toggleEditMode();
        },
        backgroundColor: kGreen,
        elevation: 1,
        child: _editMode ? Icon(Icons.check_rounded) : Icon(Icons.edit_rounded),
      ),
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
                hintText: 'Search by Part Name',
                width: _editMode ? 285 : 320,
              ),
              _editMode
                  ? InkWell(
                      onTap: () {
                        addNewPart(context);
                      },
                      child: Container(
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
                            Icons.add,
                            color: kGreen,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 0,
                    ),
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 10 / 812,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 15 / 375,
              vertical: SizeConfig.screenHeight * 10 / 812,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Robot Parts',
                    style: TextStyle(
                        color: kGreen,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Available',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Required',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 15 / 375,
                    vertical: SizeConfig.screenHeight * 10 / 812,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'B99 Motor',
                          style: TextStyle(
                              color: kGreen,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _editMode
                                ? Icon(
                                    Icons.add_circle_outline_rounded,
                                    size: 16,
                                  )
                                : SizedBox(width: 0),
                            SizedBox(width: SizeConfig.screenWidth * 5 / 375),
                            Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: SizeConfig.screenWidth * 5 / 375),
                            _editMode
                                ? Icon(
                                    Icons.remove_circle_outline_rounded,
                                    size: 16,
                                  )
                                : SizedBox(width: 0),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _editMode
                                ? Icon(
                                    Icons.add_circle_outline_rounded,
                                    size: 16,
                                  )
                                : SizedBox(width: 0),
                            SizedBox(width: SizeConfig.screenWidth * 5 / 375),
                            Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: SizeConfig.screenWidth * 5 / 375),
                            _editMode
                                ? Icon(
                                    Icons.remove_circle_outline_rounded,
                                    size: 16,
                                  )
                                : SizedBox(width: 0),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 20 / 812,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 15 / 375,
              vertical: SizeConfig.screenHeight * 10 / 812,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Tools',
                    style: TextStyle(
                        color: kGreen,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Available',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Required',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 15 / 375,
                    vertical: SizeConfig.screenHeight * 10 / 812,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'K07 Pliers',
                          style: TextStyle(
                              color: kGreen,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _editMode
                                ? Icon(
                                    Icons.add_circle_outline_rounded,
                                    size: 16,
                                  )
                                : SizedBox(width: 0),
                            SizedBox(width: SizeConfig.screenWidth * 5 / 375),
                            Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: SizeConfig.screenWidth * 5 / 375),
                            _editMode
                                ? Icon(
                                    Icons.remove_circle_outline_rounded,
                                    size: 16,
                                  )
                                : SizedBox(width: 0),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _editMode
                                ? Icon(
                                    Icons.add_circle_outline_rounded,
                                    size: 16,
                                  )
                                : SizedBox(width: 0),
                            SizedBox(width: SizeConfig.screenWidth * 5 / 375),
                            Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: SizeConfig.screenWidth * 5 / 375),
                            _editMode
                                ? Icon(
                                    Icons.remove_circle_outline_rounded,
                                    size: 16,
                                  )
                                : SizedBox(width: 0),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
