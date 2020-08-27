import 'package:flutter/material.dart';
import 'package:quizbuilder/services/database.dart';
import 'package:quizbuilder/view/addquestion.dart';
import 'package:quizbuilder/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formkey = GlobalKey<FormState>();
  String quizImageUrl, quizTitle, quizDescription, quizId;
  DatabaseService databaseService = new DatabaseService();
  bool _isLoading = false;
  createQuizOnline() async {
    if (_formkey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      // checking for validation
      quizId = randomAlphaNumeric(
          16); // for each quiz it generates an alphanumeric key

      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizImageUrl": quizImageUrl,
        "quizTitle": quizTitle,
        "quizDescription": quizDescription,
      };

      await databaseService.addQuizData(quizMap, quizId).then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AddQuestion(quizId)));
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
                key: _formkey,
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
                                val.isEmpty ? "Enter ImageCover Url" : null,
                            decoration: InputDecoration(
                              hintText: "Image Cover URL",
                              hintStyle: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black87,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16)),
                              prefixIcon: const Icon(
                                Icons.image,
                                color: Colors.red,
                              ),
                            ),
                            onChanged: (val) {
                              quizImageUrl = val;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? "Enter Title !" : null,
                            decoration: InputDecoration(
                              hintText: "Title of your Quiz",
                              hintStyle: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black87,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16)),
                              prefixIcon: const Icon(
                                Icons.title,
                                color: Colors.red,
                              ),
                            ),
                            onChanged: (val) {
                              quizTitle = val;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? "Enter Quiz Description" : null,
                            decoration: InputDecoration(
                              hintText: "Quiz Description",
                              hintStyle: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black87,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16)),
                              prefixIcon: const Icon(
                                Icons.note,
                                color: Colors.red,
                              ),
                            ),
                            onChanged: (val) {
                              quizDescription = val;
                            },
                          ),
                          SizedBox(
                            height: 140,
                          ),
                          GestureDetector(
                              onTap: () {
                                createQuizOnline();
                              },
                              child: redButton(
                                  context: context, label: "Create Quiz")),
                        ],
                      ),
                    ))));
  }
}
