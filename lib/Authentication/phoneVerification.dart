import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yuvaan/Authentication/otpScreen.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:flutter/services.dart';


class PhoneVerification extends StatefulWidget {
  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  String phoneNumber;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 95 / 812),
              Container(
                height: SizeConfig.screenHeight * 130 / 812,
                width: SizeConfig.screenWidth,
                margin:
                    EdgeInsets.only(right: SizeConfig.screenWidth * 30 / 375),
                child: Container(
                  child: Image.asset('assets/images/verify_vector.png'),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 30 / 812),
              Text(
                'Verify Your Number',
                style: TextStyle(
                  color: kGreen,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Enter your phone number',
                style: TextStyle(
                  color: kTextColorGrey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 40 / 812),
              Container(
                width: SizeConfig.screenWidth * 310 / 375,
                height: SizeConfig.screenHeight * 40 / 812,
                child: TextField(
                  onChanged: (val){
                    phoneNumber = val;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kGreen10,
                    hintText: 'Phone Number',
                    contentPadding: EdgeInsets.only(top: 5),
                    prefixIcon: Icon(
                      Icons.local_phone_rounded,
                      color: Colors.black,
                      size: 20,
                    ),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none),
                    hintStyle: TextStyle(fontSize: 14),
                  ),
                  style: TextStyle(fontSize: 14),
                  cursorColor: Colors.black,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: 5,
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 40 / 812,
            child: MaterialButton(
              height: SizeConfig.screenHeight * 40 / 812,
              elevation: 0,
              color: kGreen,
              minWidth: SizeConfig.screenWidth * 310 / 375,
              onPressed: () async{
                // await verifyPhone();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpScreen(phoneNumber: phoneNumber,),
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Proceed',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 25 / 812),
        ],
      ),
    );
  }
}
