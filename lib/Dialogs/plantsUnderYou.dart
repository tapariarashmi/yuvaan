import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';


void plantsUnderYou(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return PlantsUnderYou();
      });
}

class PlantsUnderYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: SizeConfig.screenHeight * 260 / 812,
        width: SizeConfig.screenWidth * 320 / 375,
        padding: EdgeInsets.all(SizeConfig.screenHeight * 15 / 812),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Text(
                  'Plants Under You',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight * 5 / 812),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenHeight * 5 / 812,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 10 / 375,
                        vertical: SizeConfig.screenHeight * 8 / 812,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffF1F1F1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            size: SizeConfig.screenHeight * 45 / 812,
                          ),
                          SizedBox(width: SizeConfig.screenWidth * 15 / 375),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Mandan Solar Plant',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Surat, Gujrat',
                                style: TextStyle(color: kGreen, fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
