import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:yuvaan/Utils/globalVar.dart';

class DBDetails extends ChangeNotifier{
    List<String> plantsUnderYouList = [];
    List<String> plantKeysList = [];
    List<Map<dynamic,dynamic>> plantDetails = [];
    List<Map<dynamic,dynamic>> managerDetailsList = [];
    List<Map<dynamic,dynamic>> blockDetailsList = [];
    bool fetching = true;

    void fetchstrt(){
      fetching = true;
    }

    Future<void> getPlantsUnderYouList()async{
      print('Plant List Called-------');
      try{
      Map<dynamic,dynamic> values;
      DatabaseReference reference = FirebaseDatabase.instance.reference();
      
      if(GlobalVar.accessLevel=='1'){

                await reference.child("PlantList").once().then((DataSnapshot snapshot){
                  values = snapshot.value;
                  if(values!=null){
                      plantsUnderYouList.clear();
                      plantKeysList.clear();
                      final plantKeys = values.keys.toList()..sort();
                      for( final key in plantKeys){
                        plantKeysList.add(key.toString());
                        plantsUnderYouList.add(values[key].toString());
                      }
                  }
                });
      }
      else{
                await reference.child("${GlobalVar.userPost}/${GlobalVar.userUID}/plantsVisible").once().then((DataSnapshot snapshot){
                  values = snapshot.value;
                  if(values!=null){
                      plantsUnderYouList.clear();
                      plantKeysList.clear();
                      final plantKeys = values.keys.toList()..sort();
                      for( final key in plantKeys){
                        plantKeysList.add(key.toString());
                        plantsUnderYouList.add(values[key].toString());
                      }
                  }
                  
                });
      }
      print(plantsUnderYouList);
    }
    catch(e){
      print(e);
    }
    }
    
    Future<void> getPlantDetails()async{
    print("Plant Details Called------");
    await getPlantsUnderYouList();
    Map<dynamic,dynamic> values;
    
    try{
      await FirebaseDatabase.instance.reference().child("Plants").once().then((DataSnapshot snapshot){
                values = snapshot.value;
                plantDetails.clear();
                if(values!=null)
                {
                  for(final key in plantKeysList){
                    plantDetails.add(values[key]);
                  }
                }
            });
      print(plantDetails);
    }
    catch(e){
      print(e);
    }
    fetching = false;
    print('notified');
    notifyListeners();
  }

  void getBlockList(int index){
    blockDetailsList.clear();
    print("Block Details called for index $index---");

    if(plantDetails[index]["Blocks"]!=null){
        Map<dynamic,dynamic> values = plantDetails[index]["Blocks"];
        final blockKeys = values.keys.toList()..sort();
        for(final key in blockKeys){
          blockDetailsList.add(values[key]);
        }

    }

    print(blockDetailsList);
  }

  Future<void> getManagerList()async{
    print("Managers List Fetched------");
    Map<dynamic,dynamic> values;
    
    try{
      await FirebaseDatabase.instance.reference().child("managers").once().then((DataSnapshot snapshot){
                values = snapshot.value;
                managerDetailsList.clear();
                if(values!=null)
                {
                  values.forEach((key, value) {
                    value['UID'] = key;
                    managerDetailsList.add(value); 
                    });
                }
            });
        print(managerDetailsList); 
    }
    catch(e){
      print(e);
    }
    fetching = false;
    notifyListeners();
  }
    
}