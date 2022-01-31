import 'dart:collection';

import 'package:flag_quiz/constant.dart';
import 'package:flag_quiz/db/civilizationsdao.dart';
import 'package:flag_quiz/models/flags.dart';
import 'package:flag_quiz/pages/mainpageup.dart';
import 'package:flag_quiz/pages/resultpage.dart';
import 'package:flag_quiz/widgets/quiz_answer_button.dart';
import 'package:flutter/material.dart';

class Level3 extends StatefulWidget {
  Level3({Key? key}) : super(key: key);

  @override
  _Level3State createState() => _Level3State();
}

class _Level3State extends State<Level3> {
  var questions = <Flag>[];
  var wrongOptions = <Flag>[];
  late Flag liveQuestion;
  var allOptions = HashSet<Flag>();

  int correctCount = 0;
  int wrongCount = 0;
  int questionCount = 0;
  String a =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Standard_of_Cyrus_the_Great.svg/150px-Standard_of_Cyrus_the_Great.svg.png";
  String flagPhotoUrl =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Standard_of_Cyrus_the_Great.svg/150px-Standard_of_Cyrus_the_Great.svg.png";
  String buttonAtext = "";
  String buttonBtext = "";
  String buttonCtext = "";
  String buttonDtext = "";

  Future<void> loadQuestions() async {
    liveQuestion = questions[questionCount];
    flagPhotoUrl = liveQuestion.flag_photo;
    wrongOptions = await Civilizationsdao().getFalseFlags(liveQuestion.flag_id);

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

  Future<void> getQuestions() async {
    questions = await Civilizationsdao().getFlags();
    loadQuestions();
  }

  void questionCountController() {
    questionCount = questionCount + 1;

    if (questionCount != 10) {
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                color: level3mainColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPageUp()));
                        },
                        icon: Icon(Icons.close),
                        iconSize: 40,
                        color: mainTextColor,
                      )
                    ],
                  ),
                  Material(
                    elevation: 20,
                    child: Container(
                      height: size.height / 5,
                      width: size.width / 2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              "$flagPhotoUrl",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 1.5,
                    child: Text(
                      "Question ${questionCount + 1} of 10",
                      style: TextStyle(
                        color: mainTextColor,
                        fontSize: 20,
                        fontFamily: "Lato",
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      QuizAnswerButton(
                        size: size,
                        countryName: buttonAtext,
                        fonk: () {
                          correctAnswerControl(buttonAtext);
                          questionCountController();
                        },
                      ),
                      QuizAnswerButton(
                        size: size,
                        countryName: buttonBtext,
                        fonk: () {
                          correctAnswerControl(buttonBtext);
                          questionCountController();
                        },
                      ),
                      QuizAnswerButton(
                        size: size,
                        fonk: () {
                          correctAnswerControl(buttonCtext);
                          questionCountController();
                        },
                        countryName: buttonCtext,
                      ),
                      QuizAnswerButton(
                        size: size,
                        fonk: () {
                          correctAnswerControl(buttonDtext);
                          questionCountController();
                        },
                        countryName: buttonDtext,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
