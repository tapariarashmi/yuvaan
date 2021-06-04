import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/AddNewPlant/addNewPlant.dart';
import 'package:yuvaan/Widgets/roundedSearchField.dart';
import 'package:yuvaan/Widgets/plantCard.dart';
import 'package:provider/provider.dart';
import 'package:yuvaan/core/service/data_provider.dart';

class AllPlants extends StatefulWidget {
  @override
  _AllPlantsState createState() => _AllPlantsState();
}

class _AllPlantsState extends State<AllPlants> {
  @override
  void initState() {
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    return Consumer<DBDetails>(builder: (context,dbDetails,child){
    if(dbDetails.fetching)
      return Center(child: CircularProgressIndicator());
    else {
      return Consumer<DBDetails>(
          builder: (context,dbDetails,child){
            return Scaffold(
          floatingActionButton: FloatingActionButton(
                        child: Icon(Icons.add,color:Colors.white),
                        backgroundColor: kGreen,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewPlantScreen()));
                        },
                      ),
                body: ListView.builder(
                  itemCount: dbDetails.plantDetails.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return PlantDetailCard(
                      companyName: dbDetails.plantDetails[index]['companyName'].toString(),
                      plantCapacity: dbDetails.plantDetails[index]['plantCapacity'].toString(),
                      plantName:  dbDetails.plantDetails[index]['plantName'].toString(),
                    );
                  },
                ),
                
        );
          }
      );
      }
    }
    );
    }
  }


