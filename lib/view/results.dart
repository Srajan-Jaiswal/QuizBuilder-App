import 'package:flutter/material.dart';
import 'package:quizbuilder/widgets/widgets.dart';

class Results extends StatefulWidget {
  final int correct, incorrect, total;
  Results(
      {@required this.correct, @required this.incorrect, @required this.total});
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
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
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Total Score: ${widget.correct}/${widget.total}",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "Correct Answers",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${widget.correct}",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.red,
                        fontWeight: FontWeight.w800),
                  ),
                  Text("Wrong Answers",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text(
                    "${widget.incorrect}",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.red,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 130,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: redButton(context: context, label: "Back To Home"))
                ],
              ),
            )));
  }
}
