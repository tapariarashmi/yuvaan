import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Widgets/dbTextField.dart';
import 'package:toast/toast.dart';
import 'package:yuvaan/ViewModels/addPlantViewModel.dart';
import 'assignManager.dart';


class AddNewPlantScreen extends StatefulWidget {
  @override
  _AddNewPlantScreenState createState() => _AddNewPlantScreenState();
}

class _AddNewPlantScreenState extends State<AddNewPlantScreen> {
  TextEditingController plantName = TextEditingController();

  TextEditingController plantAddress = TextEditingController();

  TextEditingController companyName = TextEditingController();

  TextEditingController plantCapacity = TextEditingController();

  bool load = false;
  AddNewPlantVM addNewPlantVM = AddNewPlantVM.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
                      child: Text('Next'),
                      backgroundColor: kGreen,
                      onPressed: (){
                        if(plantName.value==null || companyName.value==null || plantAddress.value==null || plantCapacity.value==null )
                            Toast.show('Fill all the Details', context);
                        else
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>AssignManager(plantName: plantName.text,companyName: companyName.text,plantCapacity: plantCapacity.text,plantAdress: plantAddress.text,)));
                      },
                    ),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          title: Text(
            'Add New Plant',
            style: TextStyle(
                color: Color(0xff2D2C32),
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_none_rounded,
                color: kGreen,
              ),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle_rounded,
                color: Color(0xff2D2C32),
              ),
              onPressed: () {
              },
            )
          ],
      ),
      body: load? Center(child: CircularProgressIndicator()) : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DBTextField(
            hint: "Plant's Name",
            keyboardType: TextInputType.name,
            controller: plantName,
          ),
          SizedBox(
            height: 10,
          ),
          DBTextField(
            hint: "Company's Name",
            keyboardType: TextInputType.name,
            controller: companyName,
          ),
          SizedBox(
            height: 10,
          ),
          DBTextField(
            hint: "Plant's Address",
            keyboardType: TextInputType.name,
            controller: plantAddress,
            // height: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children:[
              DBTextField(
            hint: "Plant's Capacity",
            keyboardType: TextInputType.number,
            controller: plantCapacity,
            ),
            Text('MW',style: TextStyle(color:kGreen,fontSize:40),),
            ]
          ),
          SizedBox(
            height: 10,
          ),
          
        ]
      ),
    );
  }
}