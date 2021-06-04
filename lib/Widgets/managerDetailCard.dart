import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';

class ManagerDetailCard extends StatelessWidget {
  final String managerName,email,phoneNumber;
  ManagerDetailCard({this.managerName,this.email,this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
                            color: Color(0xffE7F4EB),
                            borderRadius: BorderRadius.circular(10),
                          ),
        child: ListTile(
              isThreeLine: true,
              leading: Icon(
                    Icons.account_circle_rounded,
                    color: kGreen,
                    size: SizeConfig.screenHeight * 45 / 812,
                    ),
              title: Text(managerName,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500 , color: kGreen),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(email,
                                style: TextStyle(color:Color(0xff858585), fontSize: 12),),
                  Text(phoneNumber,
                                style: TextStyle(color:Color(0xff858585), fontSize: 12),),
                ],
              ),
        ),
      ),
    );
    }
}

