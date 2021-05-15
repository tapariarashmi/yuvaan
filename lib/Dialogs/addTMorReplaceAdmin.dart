import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:yuvaan/Widgets/dbTextField.dart';



void addTMorReplaceAdmin(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTMorReplaceAdmin();
      });
}

class AddTMorReplaceAdmin extends StatefulWidget {
  @override
  _AddTMorReplaceAdminState createState() => _AddTMorReplaceAdminState();
}

class _AddTMorReplaceAdminState extends State<AddTMorReplaceAdmin> {
  bool _addTeamMember = true;
  toggleMethod() {
    setState(() {
      _addTeamMember = !_addTeamMember;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: SizeConfig.screenHeight * 340 / 812,
        width: SizeConfig.screenWidth * 320 / 375,
        padding: EdgeInsets.all(SizeConfig.screenHeight * 15 / 812),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    toggleMethod();
                  },
                  child: Container(
                    height: SizeConfig.screenHeight * 25 / 812,
                    width: SizeConfig.screenWidth * 120 / 375,
                    decoration: BoxDecoration(
                      color: _addTeamMember ? kGreen : Colors.white,
                      border: Border.all(color: kGreen),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Center(
                      child: Text(
                        'Add Team Member',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: _addTeamMember ? Colors.white : kGreen),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    toggleMethod();
                  },
                  child: Container(
                    height: SizeConfig.screenHeight * 25 / 812,
                    width: SizeConfig.screenWidth * 120 / 375,
                    decoration: BoxDecoration(
                      color: !_addTeamMember ? kGreen : Colors.white,
                      border: Border.all(color: kGreen),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Center(
                      child: Text(
                        'Replace Admin',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: !_addTeamMember ? Colors.white : kGreen),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            DBTextField(
              hint: 'Name',
              keyboardType: TextInputType.name,
            ),
            DBTextField(
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            DBTextField(
              hint: 'Phone Number',
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 50 / 812,
              child: MaterialButton(
                height: SizeConfig.screenHeight * 50 / 812,
                elevation: 0,
                color: kGreen,
                onPressed: () {
                  //Todo:
                },
                minWidth: SizeConfig.screenWidth * 310 / 375,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
