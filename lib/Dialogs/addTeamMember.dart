import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:yuvaan/Widgets/dbTextField.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';
import 'package:yuvaan/ViewModels/add_member_viewmodel.dart';
import 'package:yuvaan/Utils/globalVar.dart';


void addTeamMember(
  {BuildContext context,String addedBy}
) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTeamMember(addedBy: addedBy,);
      });
}

class AddTeamMember extends StatefulWidget {
  final String addedBy;
  AddTeamMember({this.addedBy});
  @override
  _AddTeamMemberState createState() => _AddTeamMemberState();
}

class _AddTeamMemberState extends State<AddTeamMember> {
  AddMemberVM addMemberVM = AddMemberVM.instance;
  String _dropdownValue;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _postNameController = TextEditingController();

  @override
  void dispose() {
    
    _nameController.dispose();
    _emailController.dispose();
    _phoneNoController.dispose();
    _postNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: SizeConfig.screenHeight * 340 / 812,
        width: SizeConfig.screenWidth * 320 / 375,
        padding: EdgeInsets.all(SizeConfig.screenHeight * 15 / 812),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  'Add Team Member',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Container(
              width: SizeConfig.screenWidth * 280 / 375,
              height: SizeConfig.screenHeight * 45 / 812,
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 10 / 375,
              ),
              decoration: BoxDecoration(
                  color: Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(6)),
              child: DropdownButton<String>(
                value: _dropdownValue,
                icon: const Icon(Icons.arrow_drop_down_rounded),
                iconSize: 16,
                elevation: 1,
                isExpanded: true,
                hint: Text('Position'),
                underline: Container(
                  color: Colors.transparent,
                ),
                style: TextStyle(color: Colors.black, fontSize: 14),
                onChanged: (String newValue) {
                  setState(() {
                    _dropdownValue = newValue;
                  });
                },
                items: addMemberVM.dropDownMenu[GlobalVar.accessLevel].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            DBTextField(
              controller:_nameController,
              hint: 'Name',
              keyboardType: TextInputType.name,
              height: 45,
            ),
            DBTextField(
              controller: _emailController,
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
              height: 45,
            ),
            DBTextField(
              controller: _phoneNoController,
              hint: 'Phone Number',
              keyboardType: TextInputType.phone,
              height: 45,
            ),
            if(_dropdownValue!='Manager')
            DBTextField(
              controller: _postNameController,
              hint: 'Post Name',
              keyboardType: TextInputType.name,
              height: 45,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 45 / 812,
              child: MaterialButton(
                height: SizeConfig.screenHeight * 45 / 812,
                elevation: 0,
                color: kGreen,
                onPressed: () async{
                  if(_dropdownValue!=null && _nameController.text!=null && _emailController.text!=null && _phoneNoController.text!=null)
                  addMemberVM.addMember(
                    heading: _dropdownValue.toLowerCase()+"s",
                    name: _nameController.text,
                    phoneNumber: _phoneNoController.text,
                    post: _dropdownValue,
                    addedBy: widget.addedBy,
                    context: context,
                    postName: _postNameController.text,
                    );
                  
                  else
                  Toast.show("Invalid Addition", context,duration: 3);
                  // FirebaseDatabase.instance.reference().child('managers').push().update(value)
                  // try{
                  //  await FirebaseDatabase.instance
                  //               .reference()
                  //               .child(_dropdownValue.toLowerCase()+"s")
                  //               .push()
                  //               .update({
                  //             "name": _nameController.text,
                  //             "phoneNo": "+91${_phoneNoController.text}",
                  //             "post": _dropdownValue,
                  //             "plantsVisibile": "P0,P1",
                  //             // "email": _emailController.text,
                  //           });
                  // await FirebaseFirestore.instance
                  //               .collection('CurrentLogins')
                  //               .doc("+91${_phoneNoController.text}")
                  //               .set({
                  //             "value" : "${_dropdownValue}_By${widget.addedBy}"
                  //           });
                  // print('Added----');
                  //  Toast.show('Added Successfully! ', context , duration: 5);
                  //  Navigator.pop(context);
                  // }
                  // catch(e){
                  //    Toast.show("Error Occured", context , duration: 5);
                  //    Navigator.pop(context);
                  // }
                },
                minWidth: SizeConfig.screenWidth * 310 / 375,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
