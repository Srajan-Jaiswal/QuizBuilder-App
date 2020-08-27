import 'package:flutter/material.dart';
import 'package:quizbuilder/helper/functions.dart';
import 'package:quizbuilder/services/Auth.dart';
import 'package:quizbuilder/view/signin.dart';
import 'package:quizbuilder/widgets/widgets.dart';

import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  String name, email, password;
  AuthService authService = new AuthService();
  bool _isLoading = false;
  signUp() async {
    if (_formkey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      authService.signUpEmailAndPassword(email, password).then((value) {
        if (value != null) {
          setState(() {
            _isLoading = false;
          });
          HelperFunctions.saveUserLoggedInDetails(isLoggedin: true);  
          Navigator.pushReplacement(
              // off sending to the home screen after authentication just not stacking one above the other
              context,
              MaterialPageRoute(builder: (context) => Home()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appBar(context),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          brightness: Brightness.light,
        ),
        body: _isLoading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Form(
                key: _formkey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 120,
                        ),
                        TextFormField(
                            validator: (val) {
                              return val.isEmpty ? "Enter Name" : null;
                            },
                            decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                  borderRadius: BorderRadius.circular(16)),
                              prefixIcon: const Icon(
                                Icons.note,
                                color: Colors.red,
                              ),
                            ),
                            onChanged: (val) {
                              name = val;
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                            validator: (val) {
                              return val.isEmpty
                                  ? "Enter correct Email id"
                                  : null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter Email",
                              hintStyle: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                  borderRadius: BorderRadius.circular(16)),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.red,
                              ),
                            ),
                            onChanged: (val) {
                              email = val;
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                            obscureText: true,
                            validator: (val) {
                              return val.isEmpty ? "Enter Password" : null;
                            },
                            decoration: InputDecoration(
                                hintText: "Enter Password",
                                hintStyle: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black87),
                                    borderRadius: BorderRadius.circular(16)),
                                prefixIcon: const Icon(
                                  Icons.security,
                                  color: Colors.black87,
                                )),
                            onChanged: (val) {
                              password = val;
                            }),
                        SizedBox(
                          height: 70,
                        ),
                        GestureDetector(
                          onTap: () {
                            signUp();
                          },
                          child: redButton(context:context, label:"Sign Up"),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?",
                                style: TextStyle(
                                    fontSize: 15.5, color: Colors.black87)),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignIn()) //navigate between differrent pages  // push replacement  pushes the screen in front to which screen we are
                                    );
                              },
                              child: Text("  Sign In",
                                  style: TextStyle(
                                      fontSize: 16.5,
                                      color: Colors.red,
                                      decoration: TextDecoration.underline)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
