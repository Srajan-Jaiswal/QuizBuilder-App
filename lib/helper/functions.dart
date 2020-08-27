import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String userLoggrdInKey = "USERLOGGEDINKEY";
  static saveUserLoggedInDetails({@required bool isLoggedin}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(userLoggrdInKey, isLoggedin);
  }

  
  }
}
