import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:yuvaan/Utils/globalVar.dart';
import 'package:yuvaan/Utils/screenNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OTPLoginVM{
  static OTPLoginVM instance = OTPLoginVM._();
  OTPLoginVM._();

  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationIdh;
  List posts = ["superAdmins","managers","admins","managerTeam","adminTeam"];
  Future<void> verifyPhone({int forceResend=0,String smsCode='',String phoneNumber='',BuildContext context}) async {   
        try {   
          print(phoneNumber); 
          
            await _auth.verifyPhoneNumber(    
                forceResendingToken: forceResend,
                phoneNumber: phoneNumber, // PHONE NUMBER TO SEND OTP    
                codeAutoRetrievalTimeout: (String verId) {    
                //Starts the phone number verification process for the given phone number.    
                //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.    
                this.verificationIdh = verId;    
                },    
                codeSent: (String verificationId, int resendToken){
                  this.verificationIdh = verificationId;
                  print('code sent-----');
                  print(resendToken);
                  print(verificationId); 
                  
                } ,  
                     // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.    
                timeout: const Duration(seconds: 20),    
                verificationCompleted: (AuthCredential phoneAuthCredential) {  
                print('Verification Completed-----');  
                print(phoneAuthCredential);    
                },    
                verificationFailed: (FirebaseAuthException exceptio) { 
                Toast.show('Verification Failed', context,duration: 3);
                print('verification Failed-----');
                print('${exceptio.message}');    
                });    
        } catch (e) { 
          print('error-----')   ;
            handleError(e,context);    
        }    
    }
    handleError(FirebaseAuthException error,BuildContext context) {    
        print(error);    
        switch (error.code) {  

            case 'ERROR_INVALID_VERIFICATION_CODE':    
            print(error.code);
            Toast.show('INVALID VERIFICATION CODE', context , duration: 3);
            break;   

            default:  
            print(error.message);  
            Toast.show('Something Went Wrong', context , duration: 3);
            break;    
        }    
    } 
    
    signInWithOTP(String smsOTP,BuildContext context)async{
      try{
        AuthCredential credential = PhoneAuthProvider.credential(
           verificationId: verificationIdh,
           smsCode: smsOTP,
        );
        print('---------credentials');
        print(credential);
        final UserCredential authResult = await _auth.signInWithCredential(credential);
            
            if (authResult != null) {
             print('SignIn Successfully! ');
             print(authResult);

             Toast.show('SignIn Successfully! ', context , duration: 3);
             print('delay started');
             await Future.delayed(Duration(seconds: 3));
             print('delay ended');
            
             await _auth.currentUser.getIdTokenResult(true)
             .then((value)async{
               print(value.claims);
               GlobalVar.accessLevel = value.claims['accessLevel'];
               GlobalVar.userUID = value.claims['user_id'];
               
               GlobalVar.userPost = posts[int.parse(GlobalVar.accessLevel)-1];
               print(GlobalVar.accessLevel);
               print(GlobalVar.userUID);
               print(GlobalVar.userPost);
               SharedPreferences prefs = await SharedPreferences.getInstance();
               prefs.setBool('remember', true);
               prefs.setString('accessLevel', GlobalVar.accessLevel);
               prefs.setString('userUID', GlobalVar.userUID);
               prefs.setString('userPost', GlobalVar.userPost);
               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>navigateScreen(GlobalVar.accessLevel, context)), (route) => false);
               
             }
             );
             
              
           } else {
             Toast.show('SignIn Failed ', context , duration: 5);
            
          }
      } catch (e) { 
          print('error-----------')   ;
          handleError(e,context);    
        }    
    }
}