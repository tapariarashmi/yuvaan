import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';
import 'package:yuvaan/Utils/globalVar.dart';

class AddMemberVM{
  static AddMemberVM instance = AddMemberVM._();
  AddMemberVM._();

  Map<String,List<String>> dropDownMenu = {'1':['Manager','Admin'],'2':['Team Member','Admin'],'3':['Team Member']};
  

  Future<void> addMember({String heading, String name, String phoneNumber,String post,String addedBy,String postName='',BuildContext context}) async{

    try{
            if(post=='Manager'){
               await FirebaseDatabase.instance.reference().child("managers").push()
                      .update({
                              "name": name,
                              "phoneNo": "+91$phoneNumber",
                              "post": "$post@Vysion",
                              "plantsVisibile": "P0,P1"
                            });
               await FirebaseFirestore.instance.collection('CurrentLogins').doc("+91$phoneNumber")
                      .set({
                              "value" : "${post}_BySuperAdmin"
                            });
                print('Added----');
                   Toast.show('Added Successfully! ', context , duration: 3);
                   Navigator.pop(context);
            }
            else if(post=='Admin'){
               await FirebaseDatabase.instance.reference().child("admins").push()
                      .update({
                              "name": name,
                              "phoneNo":"+91$phoneNumber",
                              "post":"Admin@$postName",
                              "plantsVisibile": "P1",
                              });
               await FirebaseFirestore.instance.collection('CurrentLogins').doc("+91$phoneNumber")
                      .set({
                              "value":"Admin@${postName}_By$addedBy"
                          });
              print('Added----');
                   Toast.show('Added Successfully! ', context , duration: 3);
                   Navigator.pop(context);
            }
            else if(post.startsWith('Team')){
                String decideTeam = GlobalVar.accessLevel == '2' ? "managerTeam" : "adminTeam";
                String decideuid = GlobalVar.userUID;
                String byWhom = GlobalVar.accessLevel == '2'?"ByManager" : "ByAdmin";

               await FirebaseDatabase.instance.reference().child("$decideTeam/$decideuid").push()
                      .update({
                                "name": name,
                                "phoneNo": "+91$phoneNumber",
                                "post": "$postName@Vysion",
                                "plantsVisibile": "C0,C1"
                              });
               await FirebaseFirestore.instance.collection('CurrentLogins').doc("+91$phoneNumber")
                      .set({
                                "value":"$postName@Vysion_${byWhom}_$decideuid}"
                           });
                String value =  "$postName@Vysion_${byWhom}_$decideuid}";
                var values = value.split('_');
                print(values);
              print('Added----');
                   Toast.show('Added Successfully! ', context , duration: 3);
                   Navigator.pop(context);
            }
            else{
              print('Failed----');
                   Toast.show('Failed ', context , duration: 3);
                   Navigator.pop(context);
            }
                  
                  
      }
      catch(e){
                     Toast.show("Error Occured", context , duration: 3);
                     Navigator.pop(context);
      }

  }
}