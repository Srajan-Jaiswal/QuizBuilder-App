import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
//  helper function class
class HelperFunctions {
  static String userLoggrdInKey = "USERLOGGEDINKEY";
  static saveUserLoggedInDetails({@required bool isLoggedin}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(userLoggrdInKey, isLoggedin);
  }
static Future<bool> getUserLoggedInDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoggrdInKey);
  
  }
}
