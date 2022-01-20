import 'dart:collection';

import 'package:flag_quiz/db/flagsdao.dart';
import 'package:flag_quiz/models/flags.dart';
import 'package:flag_quiz/pages/resultpage.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var questions = <Flag>[];
  var wrongOptions = <Flag>[];
  late Flag liveQuestion;
  var allOptions = HashSet<Flag>();

  int correctCount = 0;
  int wrongCount = 0;
  int questionCount = 0;

  String flagPhotoName = "turkey.png";
  String buttonAtext = "";
  String buttonBtext = "";
  String buttonCtext = "";
  String buttonDtext = "";

  Future<void> getQuestions() async {
    questions = await Flagsdao().getFlags();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    liveQuestion = questions[questionCount];

    flagPhotoName = liveQuestion.flag_photo;

    wrongOptions = await Flagsdao().getFalseFlags(liveQuestion.flag_id);

    allOptions.clear();
    allOptions.add(liveQuestion);
    allOptions.add(wrongOptions[0]);
    allOptions.add(wrongOptions[1]);
    allOptions.add(wrongOptions[2]);

    buttonAtext = allOptions.elementAt(0).flag_name;
    buttonBtext = allOptions.elementAt(1).flag_name;
    buttonCtext = allOptions.elementAt(2).flag_name;
    buttonDtext = allOptions.elementAt(3).flag_name;

    setState(() {});
  }

  void questionCountController() {
    questionCount = questionCount + 1;

    if (questionCount != 4) {
      loadQuestions();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              correctAnswer: correctCount,
            ),
          ));
    }
  }

  void correctAnswerControl(String buttonText) {
    if (liveQuestion.flag_name == buttonText) {
      correctCount = correctCount + 1;
    } else {
      wrongCount = wrongCount + 1;
    }
  }

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Quiz Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Doğru : $correctCount", style: TextStyle(fontSize: 20)),
                Text("Yanlış : $wrongCount", style: TextStyle(fontSize: 20)),
              ],
            ),
            Text(
              "${questionCount + 1}. Soru",
              style: TextStyle(fontSize: 30),
            ),
            Image.asset("assets/$flagPhotoName"),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      correctAnswerControl(buttonAtext);
                      questionCountController();
                    },
                    child: Text(buttonAtext)),
                ElevatedButton(
                    onPressed: () {
                      correctAnswerControl(buttonBtext);
                      questionCountController();
                    },
                    child: Text(buttonBtext)),
                ElevatedButton(
                    onPressed: () {
                      correctAnswerControl(buttonCtext);
                      questionCountController();
                    },
                    child: Text(buttonCtext)),
                ElevatedButton(
                    onPressed: () {
                      correctAnswerControl(buttonDtext);
                      questionCountController();
                    },
                    child: Text(buttonDtext)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
