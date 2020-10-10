import 'package:flutter/material.dart';
import 'package:quizbuilder/services/database.dart';
import 'package:quizbuilder/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;
  AddQuestion(this.quizId); // getting quizid from the screen create quiz
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  String question, option1, option2, option3, option4;
  bool _isLoading = false;
  DatabaseService databaseService = new DatabaseService();
  uploadQuestionData() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      
      // this is a condition to validate the form
      await databaseService
          .addQuestionData(questionMap, widget.quizId)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
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
        iconTheme: IconThemeData(color: Colors.red),
        brightness: Brightness.light,
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Please Enter Question" : null,
                        decoration: InputDecoration(
                          hintText: "Enter the Question",
                          hintStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black87,
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0)),
                          prefixIcon: const Icon(
                            Icons.note,
                            color: Colors.red,
                          ),
                        ),
                        onChanged: (val) {
                          question = val;
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter OPTION 1" : null,
                        decoration: InputDecoration(
                          hintText: "      OPTION 1(Correct Answer)",
                          hintStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal),
                          prefixIcon: const Icon(
                            Icons.input,
                            color: Colors.red,
                          ),
                        ),
                        onChanged: (val) {
                          option1 = val;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter OPTION 2" : null,
                        decoration: InputDecoration(
                          hintText: "            OPTION 2",
                          hintStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal),
                          prefixIcon: const Icon(
                            Icons.input,
                            color: Colors.red,
                          ),
                        ),
                        onChanged: (val) {
                          option2 = val;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter OPTION 3" : null,
                        decoration: InputDecoration(
                          hintText: "            OPTION 3",
                          hintStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal),
                          prefixIcon: const Icon(
                            Icons.input,
                            color: Colors.red,
                          ),
                        ),
                        onChanged: (val) {
                          option3 = val;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter OPTION 4" : null,
                        decoration: InputDecoration(
                          hintText: "            OPTION 4",
                          hintStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal),
                          prefixIcon: const Icon(
                            Icons.input,
                            color: Colors.red,
                          ),
                        ),
                        onChanged: (val) {
                          option4 = val;
                        },
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: redButton(
                                context: context,
                                label: "Submit",
                                buttonWidth:
                                    MediaQuery.of(context).size.width / 2 - 36),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          GestureDetector(
                              onTap: () {
                                uploadQuestionData();
                              },
                              child: redButton(
                                  context: context,
                                  label: "Add Question",
                                  buttonWidth:
                                      MediaQuery.of(context).size.width / 2 -
                                          36))
                        ],
                      )
                    ],
                  ))),
            ),
    );
  }
}
