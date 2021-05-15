import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yuvaan/Authentication/otpScreen.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

class PhoneVerification extends StatefulWidget {
  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  String phoneNumber;
  String verificationId;
  String smsOTP;
  String errorMessage;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhone() async {    
      // await Firebase.initializeApp();
        final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {  
            print('code sent');
             
            this.verificationId = verId;   
            print(verificationId); 
            // smsOTPDialog(context).then((value) {    
            // print('sign in');    
            // });    
        };    
        try {   
          print(phoneNumber); 
            await _auth.verifyPhoneNumber(    
                phoneNumber: this.phoneNumber, // PHONE NUMBER TO SEND OTP    
                codeAutoRetrievalTimeout: (String verId) {    
                //Starts the phone number verification process for the given phone number.    
                //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.    
                this.verificationId = verId;    
                },    
                codeSent:    
                    smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.    
                timeout: const Duration(seconds: 20),    
                verificationCompleted: (AuthCredential phoneAuthCredential) {  
                  print('timeout');  
                print(phoneAuthCredential);    
                },    
                verificationFailed: (FirebaseAuthException exceptio) {    
                  print('exceptio');
                print('${exceptio.message}');    
                });    
        } catch (e) { 
          print('error')   ;
            handleError(e);    
        }    
    }    

        Future<bool> smsOTPDialog(BuildContext context) {    
        return showDialog(    
            context: context,    
            barrierDismissible: false,    
            builder: (BuildContext context) {    
                return new AlertDialog(    
                title: Text('Enter SMS Code'),    
                content: Container(    
                    height: 85,    
                    child: Column(children: [    
                    TextField(    
                        onChanged: (value) {    
                        this.smsOTP = value;    
                        },    
                    ),    
                    (errorMessage != ''    
                        ? Text(    
                            errorMessage,    
                            style: TextStyle(color: Colors.red),    
                            )    
                        : Container())    
                    ]),    
                ),    
                contentPadding: EdgeInsets.all(10),    
                actions: <Widget>[    
                    FlatButton(    
                    child: Text('Done'),    
                    onPressed: (){
                      print('Done');
                    },
                   ),    
                    
                ],    
                );    
        });    
    }    

    

    handleError(PlatformException error) {    
        print(error);    
        switch (error.code) {    
            case 'ERROR_INVALID_VERIFICATION_CODE':    
            FocusScope.of(context).requestFocus(new FocusNode());    
            setState(() {    
                errorMessage = 'Invalid Code';    
            });    
            Navigator.of(context).pop();    
            smsOTPDialog(context).then((value) {    
                print('sign in');    
            });    
            break;    
            default:    
            setState(() {    
                errorMessage = error.message;    
            });    
    
            break;    
        }    
    } 
  

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
