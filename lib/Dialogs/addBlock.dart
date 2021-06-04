import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:yuvaan/Widgets/dbTextField.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:toast/toast.dart';
import 'package:yuvaan/bottom.dart';
import 'package:provider/provider.dart';
import 'package:yuvaan/core/service/data_provider.dart';

void addNewBlock(
  BuildContext context,int index
) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddNewBlock(index);
      });
}

class AddNewBlock extends StatefulWidget {
  final int index;
  AddNewBlock(this.index);
  @override
  _AddNewBlockState createState() => _AddNewBlockState();
}

class _AddNewBlockState extends State<AddNewBlock> {
  TextEditingController strt = TextEditingController();
  TextEditingController end = TextEditingController();
  
   Future<bool> addBlock()async{
     bool success = true;
      try{
      if(int.parse(strt.text)>int.parse(end.text))
        return false;
      Provider.of<DBDetails>(context,listen: false).fetchstrt();
      int len = Provider.of<DBDetails>(context,listen: false).blockDetailsList.length;
      String plantKey = Provider.of<DBDetails>(context,listen: false).plantKeysList[widget.index];
      await FirebaseDatabase.instance.reference().child('Plants/$plantKey/Blocks/B${len+1}')
                .update({
                  'startCode': strt.text,
                  'endCode': end.text,
                });
      await Provider.of<DBDetails>(context,listen: false).getPlantDetails();
      Provider.of<DBDetails>(context,listen: false).getBlockList(widget.index);
      
      }
      catch(e){
        print(e);
        success = false;
      }
      return success;
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Consumer<DBDetails>(builder: (context,dbDetails,child){
          return Container(
          height: SizeConfig.screenHeight * 340 / 812,
          width: SizeConfig.screenWidth * 320 / 375,
          padding: EdgeInsets.all(SizeConfig.screenHeight * 15 / 812),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                    'Create Block',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
              DBTextField(
                hint: 'Start Code',
                keyboardType: TextInputType.number,
                controller: strt,
              ),
              DBTextField(
                hint: 'End Code',
                keyboardType: TextInputType.number,
                controller: end,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 50 / 812,
                child: MaterialButton(
                  height: SizeConfig.screenHeight * 50 / 812,
                  elevation: 0,
                  color: kGreen,
                  onPressed: () async{
                    Toast.show("Adding...", context,duration: 2);
                    bool success = await addBlock();
                    if(success){
                      Toast.show("Added SuccessFully", context,duration: 2);
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomItems(index: widget.index,)), (route) => false);
                    }
                    else{
                      Toast.show("Failed! Please try again", context,duration: 2);
                    }
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
        );
      }
      )
      );
    
  }
}
