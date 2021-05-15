import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';

void addComment(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddComment();
      });
}

class AddComment extends StatelessWidget {
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
                  'Commenting On',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight * 5 / 812),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          'Motor not working Motor not working Motor not working Motor not working Motor not working',
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
            ),
            Container(
              width: SizeConfig.screenWidth * 280 / 375,
              height: SizeConfig.screenHeight * 120 / 812,
              child: TextField(
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: 'Type Here',
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: kGreen)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: kGreen)),
                  hintStyle: TextStyle(fontSize: 14),
                ),
                style: TextStyle(fontSize: 14),
                cursorColor: Colors.black,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 45 / 812,
              child: MaterialButton(
                height: SizeConfig.screenHeight * 45 / 812,
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
                  'Done',
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
