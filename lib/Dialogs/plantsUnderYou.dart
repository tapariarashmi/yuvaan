import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:yuvaan/bottom.dart';
import 'package:provider/provider.dart';
import 'package:yuvaan/core/service/data_provider.dart';

void plantsUnderYou(
  BuildContext context, 
) {
  showDialog(
      context: context,
      builder: (BuildContext context)=>PlantsUnderYou()
      );
}

class PlantsUnderYou extends StatefulWidget {

  @override
  _PlantsUnderYouState createState() => _PlantsUnderYouState();
}

class _PlantsUnderYouState extends State<PlantsUnderYou> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Consumer<DBDetails>(
        builder: (context,dbDetails,child){
          return Container(
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
                  itemCount: dbDetails.plantDetails.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomItems(index: index,)), (route) => false);
                      },
                        child: Padding(
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
                                    dbDetails.plantDetails[index]['plantName'].toString(),
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    dbDetails.plantDetails[index]['plantAddress'].toString(),
                                    style: TextStyle(color: kGreen, fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
        }
      ),
    );
  }
}
