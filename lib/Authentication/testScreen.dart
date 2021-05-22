import 'package:flutter/material.dart';
import 'package:yuvaan/Dialogs/addTeamMember.dart';
import 'package:yuvaan/Utils/globalVar.dart';

class TestScreen extends StatelessWidget {
  final String appBarTitle;
  TestScreen({this.appBarTitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle),),
      body: Center(
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:(){
            if(GlobalVar.accessLevel=='1' || GlobalVar.accessLevel=='2' || GlobalVar.accessLevel=='3')
            addTeamMember(context: context,addedBy: appBarTitle);
          }
          ),
      ),
    );
  }
}