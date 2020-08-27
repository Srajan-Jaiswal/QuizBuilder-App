import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // for uploading quiz
  Future<void> addQuizData(Map quizData, String quizId) async {
    await Firestore.instance
        .collection("Quiz")
        .document(quizId)
        .setData(quizData)
        .catchError((e) {
      print(e.toString());
    });
  }

// Adding Questions to the Database
  Future<void> addQuestionData(Map questionData, String quizId) async {
    await Firestore.instance
        .collection("Quiz")
        .document(quizId)
        .collection("QNA")
        .add(questionData)
        .catchError((e) {
      print(e);
    });
  }

// function for  fetching data
  getQuizData() async {
    return await Firestore.instance.collection("Quiz").snapshots();
    // Stream
  }

  getQuizesData(String quizId) async {
    return await Firestore.instance
        .collection("Quiz")
        .document(quizId)
        .collection("QNA")
        .getDocuments();    
  }
}
