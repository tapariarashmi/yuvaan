import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Widgets/managerDetailCard.dart';
import 'package:yuvaan/Dialogs/addTeamMember.dart';
import 'package:provider/provider.dart';
import 'package:yuvaan/core/service/data_provider.dart';

class AllManagerList extends StatefulWidget {
  @override
  _AllManagerListState createState() => _AllManagerListState();
}

class _AllManagerListState extends State<AllManagerList> {
  @override
  void initState() {
    super.initState();
    Provider.of<DBDetails>(context,listen: false).fetchstrt();
    Provider.of<DBDetails>(context,listen: false).getManagerList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DBDetails>(builder: (context,dbDetails,child){
    if(dbDetails.fetching)
      return Center(child: CircularProgressIndicator());
    else
      return Scaffold(
        floatingActionButton: FloatingActionButton(
                      child: Icon(Icons.add,color:Colors.white),
                      backgroundColor: kGreen,
                      onPressed: (){
                       addTeamMember(context: context);
                      },
                    ),
              body: ListView.builder(
                itemCount: dbDetails.managerDetailsList.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return ManagerDetailCard(
                    managerName: dbDetails.managerDetailsList[index]['name'].toString(),
                    email: dbDetails.managerDetailsList[index]['phoneNo'].toString(),
                    phoneNumber:  dbDetails.managerDetailsList[index]['email'].toString(),
                  );
                },
              ),
              
      );
      });
  }
}