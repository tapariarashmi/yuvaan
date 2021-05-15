import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:yuvaan/Widgets/dbTextField.dart';

void addNewPart(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddNewPart();
      });
}

class AddNewPart extends StatefulWidget {
  @override
  _AddNewPartState createState() => _AddNewPartState();
}

class _AddNewPartState extends State<AddNewPart> {
  String _dropdownValue = 'Part';

  @override
  Widget build(BuildContext context) {
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
              children: [
                Text(
                  'Add new Part/Tool',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Container(
              width: SizeConfig.screenWidth * 280 / 375,
              height: SizeConfig.screenHeight * 45 / 812,
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 10 / 375,
              ),
              decoration: BoxDecoration(
                  color: Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(6)),
              child: DropdownButton<String>(
                value: _dropdownValue,
                icon: const Icon(Icons.arrow_drop_down_rounded),
                iconSize: 16,
                elevation: 1,
                isExpanded: true,
                hint: Text('Position'),
                underline: Container(
                  color: Colors.transparent,
                ),
                style: TextStyle(color: Colors.black, fontSize: 14),
                onChanged: (String newValue) {
                  setState(() {
                    _dropdownValue = newValue;
                  });
                },
                items: <String>[
                  'Part',
                  'Tool',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            DBTextField(
              hint: 'Part/Tool Name',
              keyboardType: TextInputType.name,
            ),
            DBTextField(
              hint: 'Total Number',
              keyboardType: TextInputType.number,
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
