import 'package:flutter/material.dart';
import 'package:yuvaan/Authentication/phoneVerification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/service/pref_service.dart';
import 'Utils/screenNavigation.dart';
import 'Utils/globalVar.dart';
import 'package:provider/provider.dart';
import 'core/service/data_provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Prefs.getUser().then((value) => runApp(MyApp(remember: value,)));
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool remember;
  MyApp({this.remember});
  @override 
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>DBDetails(),
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: Colors.white,
        ),
        home: remember?navigateScreen(GlobalVar.accessLevel, context):PhoneVerification(),
      ),
    );
  }
}
