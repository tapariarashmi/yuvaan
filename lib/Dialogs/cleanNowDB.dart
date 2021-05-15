import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';

void cleanNow(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CleanNow();
      });
}

class CleanNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        height: SizeConfig.screenHeight * 175 / 812,
        width: SizeConfig.screenWidth * 300 / 375,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 20 / 812,
            ),
            Expanded(
              child: Text(
                'Clean Now',
                style: TextStyle(
                    color: kGreen, fontWeight: FontWeight.w700, fontSize: 24),
              ),
            ),
            Expanded(
              child: Text(
                'Are you sure you want to change\nthe existing schedule?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      splashColor: null,
                      height: SizeConfig.screenHeight * 50 / 812,
                      elevation: 0,
                      color: Colors.white,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      height: SizeConfig.screenHeight * 50 / 812,
                      elevation: 0,
                      color: kGreen,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
