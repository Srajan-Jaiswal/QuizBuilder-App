import 'package:flutter/material.dart';
import 'package:quizbuilder/helper/functions.dart';
import 'package:quizbuilder/view/home.dart';
import 'package:quizbuilder/view/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedin = false;
  @override
  void initState() {
    checkedUserLoggedInStatus();
    super.initState();
  }

  checkedUserLoggedInStatus() async {
  HelperFunctions.getUserLoggedInDetails().then((value){
    setState((){
      _isLoggedin = value;
    });
  });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (_isLoggedin?? false)? Home(): SignIn(),
    );
  }
}
