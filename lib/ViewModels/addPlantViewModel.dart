import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:yuvaan/core/service/data_provider.dart';

class AddNewPlantVM{
  static AddNewPlantVM instance = AddNewPlantVM._();
  AddNewPlantVM._();

  Future<int> addNewPlant({String plantName,String companyName,String plantAddress,String plantCapacity,String managerUID,BuildContext context})async{
    int success = -1;
    int len = Provider.of<DBDetails>(context,listen: false).plantsUnderYouList.length;
    try{
      await FirebaseDatabase.instance.reference().child("PlantList").update({"P${len+1}": plantName});
      await FirebaseDatabase.instance.reference().child("Plants/P${len+1}").update({
                              "plantName": plantName,
                              "companyName": companyName,
                              "plantAddress": plantAddress,
                              "plantCapacity": plantCapacity,
          }
        );
      await FirebaseDatabase.instance.reference().child("managers/$managerUID/plantsVisible")
                      .update({
                        "P${len+1}": plantName,
                      });
      success = len+1;
    }
    catch(e){
      print(e);
      success=-1;
    }
    return success;
  }

}

