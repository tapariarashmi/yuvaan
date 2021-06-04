import 'package:shared_preferences/shared_preferences.dart';
import 'package:yuvaan/Utils/globalVar.dart';


class Prefs{
  static Future<bool> getUser()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    bool rememberMe=preferences.getBool('remember')??false;
    if(rememberMe){
    GlobalVar.accessLevel = preferences.getString("accessLevel");
    GlobalVar.userUID = preferences.getString("userUID");
    GlobalVar.userPost = preferences.getString("userPost");
    }
    return rememberMe;
  }
}