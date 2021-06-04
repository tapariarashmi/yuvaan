import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Widgets/managerDetailCard.dart';
import 'package:yuvaan/ViewModels/addPlantViewModel.dart';
import 'package:toast/toast.dart';
import 'package:yuvaan/bottom.dart';
import 'package:provider/provider.dart';
import 'package:yuvaan/core/service/data_provider.dart';

class AssignManager extends StatefulWidget {
  final String plantName,companyName,plantCapacity,plantAdress;
  AssignManager({this.companyName,this.plantCapacity,this.plantName,this.plantAdress});
  @override
  _AssignManagerState createState() => _AssignManagerState();
}

class _AssignManagerState extends State<AssignManager> {
  @override
  void initState() {
    Provider.of<DBDetails>(context,listen: false).fetchstrt();
    Provider.of<DBDetails>(context,listen: false).getManagerList();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<DBDetails>(builder: (context,dbDetails,child){
          return Scaffold(
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
        body: (dbDetails.fetching)? Center(child: CircularProgressIndicator()) : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select a Manager',style: TextStyle(color:Color(0xff858585)),),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: dbDetails.managerDetailsList.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    showDialog(
                          context: context,
                          
                          builder: (BuildContext context) {
                            bool adding = false;
                            AddNewPlantVM addNewPlantVM = AddNewPlantVM.instance;
                            return adding?CircularProgressIndicator():AlertDialog(
                              title: Text('Are you sure you want to add ${dbDetails.managerDetailsList[index]['name'].toString()} as the manager of the plant ${widget.plantName}?'),
                              actions: [
                                FlatButton(onPressed: (){Navigator.pop(context);}, child: Text('No')),
                                FlatButton(onPressed: ()async{
                                  adding = true;
                                  setState(() {
                                  });
                                  int success = await addNewPlantVM.addNewPlant(
                                    plantName: widget.plantName,
                                    companyName: widget.companyName,
                                    plantAddress: widget.plantAdress,
                                    plantCapacity: widget.plantCapacity,
                                    managerUID: dbDetails.managerDetailsList[index]['UID'].toString(),
                                    context: context
                                  );
                                  
                                  if(success!=-1){
                                    Toast.show("Added SuccessFully", context);
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomItems(index:success-1,fetch: 1,),),(route)=>false);
                                  }
                                  else{
                                    Toast.show("Failed! Please try again", context);
                                  }
                                }, child: Text('Yes')),

                              ],
                            );
                        });
                  },
                   child: ManagerDetailCard(
                      managerName: dbDetails.managerDetailsList[index]['name'].toString(),
                      email: dbDetails.managerDetailsList[index]['phoneNo'].toString(),
                      phoneNumber:  dbDetails.managerDetailsList[index]['email'].toString(),
                   )
                );
              },
            ),
            
          ]
        ),
      );
    }
    );
    
  }
}

