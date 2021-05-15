import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvaan/Utils/constants.dart';
import 'package:yuvaan/Utils/sizeConfig.dart';
import 'package:yuvaan/bottom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:timer_button/timer_button.dart';
import 'package:toast/toast.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  OtpScreen({this.phoneNumber=''});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String fird='',secd='',thid='',foud='',fifd='',sixd='';
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationIdh;
  String smsOTP='';
  String errorMessage;
  Future<void> verifyPhone({int forceResend=0,String smsCode=''}) async {   
        try {   
          print(widget.phoneNumber); 
          
            await _auth.verifyPhoneNumber(    
                forceResendingToken: forceResend,
                phoneNumber: this.widget.phoneNumber, // PHONE NUMBER TO SEND OTP    
                codeAutoRetrievalTimeout: (String verId) {    
                //Starts the phone number verification process for the given phone number.    
                //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.    
                this.verificationIdh = verId;    
                },    
                codeSent: (String verificationId, int resendToken){
                  print('code sent');
                  print(resendToken);
                  this.verificationIdh = verificationId;
                   print(verificationId); 
                  
                } ,  
                     // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.    
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
    handleError(FirebaseAuthException error) {    
        print(error);    
        switch (error.code) {    
            case 'ERROR_INVALID_VERIFICATION_CODE':    
            print(error.code);
            Toast.show('INVALID VERIFICATION CODE', context , duration: 5);
            break;    
            default:  
            print(error.message);  
            Toast.show('INVALID VERIFICATION CODE', context , duration: 5);
            break;    
        }    
    } 
    signInWithOTP(String smsOTP)async{
      try{
      AuthCredential credential = PhoneAuthProvider.credential(
           verificationId: verificationIdh,
           smsCode: smsOTP,
        );
        print('---------credentials');
                  print(credential);
                final UserCredential authResult = await _auth
             .signInWithCredential(credential);
            

           if (authResult != null) {
             print('SignIn Successfully! ');
             Toast.show('SignIn Successfully! ', context , duration: 5);
             Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomItems(),
                    ),
                  );
              
           } else {
             Toast.show('SignIn Failed ', context , duration: 5);
            
          }
      } catch (e) { 
          print('error-----------')   ;
          handleError(e);    
        }    
    }
    @override
  void initState() {
    super.initState();
    verifyPhone(forceResend: 0);
  }
      

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
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
                    child: Image.asset('assets/images/otp_vector.png'),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 30 / 812),
                Text(
                  'OTP Verification',
                  style: TextStyle(
                    color: kGreen,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 5 / 812),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 32 / 375),
                  child: Text(
                    'A 6 Digit One Time Password is sent to your\nmobile number ${widget.phoneNumber}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kTextColorGrey,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 40 / 812),
                Container(
                  width: SizeConfig.screenWidth * 310 / 375,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OTPField(
                        onChanged: (val){
                          
                          fird = val;
                          if(val.length==1)
                          FocusScope.of(context).nextFocus();
                          
                        },
                      ),
                      OTPField(
                        onChanged: (val){
                          secd=val;
                          if(val.length==1)
                          FocusScope.of(context).nextFocus();
                          
                        },
                      ),
                      OTPField(
                        onChanged: (val){
                          thid = val;
                          if(val.length==1)
                          FocusScope.of(context).nextFocus();
                          
                        },
                      ),
                      OTPField(
                        onChanged: (val){
                          foud=val;
                          if(val.length==1)
                          FocusScope.of(context).nextFocus();
                          
                        },
                      ),
                      OTPField(
                        onChanged: (val){
                          fifd=val;
                          if(val.length==1)
                          FocusScope.of(context).nextFocus();
                          
                        },
                      ),
                      OTPField(
                        onChanged: (val){
                          sixd=val;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Expanded(
            //   child: Container(
            //     width: 5,
            //   ),
            // ),
            TimerButton(
                    label: "Send OTP Again",
                    timeOutInSeconds: 20,
                    onPressed: () {
                      verifyPhone(forceResend: 1);
                    },
                    disabledColor: Colors.grey,
                    color: Colors.green,
                    disabledTextStyle: new TextStyle(fontSize: 20.0),
                    activeTextStyle: new TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
            SizedBox(
              height: SizeConfig.screenHeight * 40 / 812,
              child: MaterialButton(
                elevation: 0,
                color: kGreen,
                minWidth: SizeConfig.screenWidth * 310 / 375,
                onPressed: () {
                  smsOTP = fird+secd+thid+foud+fifd+sixd;
                  print(smsOTP);
                  if(smsOTP.length==6)
                  signInWithOTP(smsOTP);
                  else
                  Toast.show('Enter valid OTP', context , duration: 5);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Verify & Proceed',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 25 / 812),
          ],
        ),
      ),
    );
  }
}

class OTPField extends StatelessWidget {
  final Function onChanged;
  OTPField({this.onChanged});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 30 / 375,
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.number,
        cursorColor: Colors.black,
        onChanged: onChanged,
      ),
    );
  }
}
