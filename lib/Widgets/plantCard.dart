import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';

class PlantDetailCard extends StatelessWidget {
  final String plantName,companyName,plantCapacity;
  PlantDetailCard({this.companyName,this.plantCapacity,this.plantName});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: kGreen),
                            borderRadius: BorderRadius.circular(10),
                          ),
        child: ListTile(
              
              leading: Icon(
                    Icons.account_circle_rounded,
                    color: Colors.black,
                    size: SizeConfig.screenHeight * 45 / 812,
                    ),
              title: Text(plantName,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500 , color: Colors.black),),
              subtitle: Text(companyName,
                            style: TextStyle(color: Colors.grey, fontSize: 12),),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                  Text(plantCapacity,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500 , color: Colors.black),),
                  Text("MW",
                            style: TextStyle(color: Colors.black, fontSize: 12),),
                ]
              ),
        ),
      ),
    );
    }
}

// Padding(
//                       padding: EdgeInsets.symmetric(
//                         vertical: SizeConfig.screenHeight * 5 / 812,
//                       ),
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: SizeConfig.screenWidth * 10 / 375,
//                           vertical: SizeConfig.screenHeight * 8 / 812,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(color: kGreen),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.account_circle_rounded,
//                                   size: SizeConfig.screenHeight * 45 / 812,
//                                 ),
//                                 SizedBox(width: SizeConfig.screenWidth * 15 / 375),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   plantName,
//                                   style: TextStyle(
//                                       fontSize: 16, fontWeight: FontWeight.w500 , color: Colors.black),
//                                 ),
//                                 Text(
//                                   companyName,
//                                   style: TextStyle(color: Colors.grey, fontSize: 12),
//                                 ),
//                               ],
//                             ),
//                               ],
//                             ),
                            
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children:[
//                               Text(
//                                   plantCapacity,
//                                   style: TextStyle(
//                                       fontSize: 16, fontWeight: FontWeight.w500 , color: Colors.black),
//                                 ),
//                                 Text(
//                                   'MW',
//                                   style: TextStyle(color: Colors.black, fontSize: 12),
//                                 ),
//                             ])
//                           ],
//                         ),
//                       ),
//                     );
 