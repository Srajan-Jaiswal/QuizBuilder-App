import 'package:flutter/material.dart';
import 'package:quizbuilder/helper/functions.dart';
import 'package:quizbuilder/services/Auth.dart';
import 'package:quizbuilder/view/signup.dart';
import 'package:quizbuilder/widgets/widgets.dart';

import 'home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

bool _isLoading = false;

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  String email, password; // for validation
  AuthService authService = new AuthService();
  signIn() async {
    if (_formkey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService.signInEmailAndPass(email, password).then((val) {
        if (val != null) {
          setState(() {
            _isLoading = false;
          });
          HelperFunctions.saveUserLoggedInDetails(isLoggedin: true);
          Navigator.pushReplacement(
              // off sending to the home screen after authentication
              context,
              MaterialPageRoute(builder: (context) => Home()));
          //navigate the user to the home screen
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
              ))
            : Form(
                // is it is correct
                key: _formkey,

                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 160,
                      ),
                      TextFormField(
                          validator: (val) {
                            return val.isEmpty
                                ? "Enter correct Email id"
                                : null;
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
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
                        height: 20,
                      ),
                      TextFormField(
                          validator: (val) {
                            return val.isEmpty ? "Enter Password" : null;
                          },
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black87,
                                  ),
                                  borderRadius: BorderRadius.circular(16)),
                              prefixIcon: const Icon(
                                Icons.security,
                                color: Colors.black87,
                              )),
                          onChanged: (val) {
                            email = val;
                          }),
                      SizedBox(
                        height: 100,
                      ),
                      GestureDetector(
                        onTap: () {
                          signIn();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 55,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 48,
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",
                              style: TextStyle(
                                  fontSize: 15.5, color: Colors.black87)),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignUp()) //navigate between differrent pages  // push replacement  pushes the screen in front to which screen we are
                                    );
                              },
                              child: Text("  Sign Up",
                                  style: TextStyle(
                                      fontSize: 16.5,
                                      color: Colors.red,
                                      decoration: TextDecoration.underline)))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
                ),
              ));
  }
}
