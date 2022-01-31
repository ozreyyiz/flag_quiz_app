import 'dart:collection';

import 'package:flag_quiz/constant.dart';
import 'package:flag_quiz/db/flagsdao.dart';
import 'package:flag_quiz/db/world_flagsdao.dart';
import 'package:flag_quiz/models/flags.dart';
import 'package:flag_quiz/pages/mainpageup.dart';
import 'package:flag_quiz/pages/resultpage.dart';
import 'package:flag_quiz/widgets/quiz_answer_button.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Level2 extends StatefulWidget {
  Level2({Key? key}) : super(key: key);

  @override
  _Level2State createState() => _Level2State();
}

class _Level2State extends State<Level2> {
  var questions = <Flag>[];
  var wrongOptions = <Flag>[];
  var allOptions = HashSet<Flag>();
  late Flag liveQuestions;

  int correctCount = 0;
  int wrongCount = 0;
  int questionCount = 0;

  String flagPhotoName =
      "https://file.wikipediam.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/188px-Flag_of_Canada_%28Pantone%29.svg.png";
  String buttonAtext = "";
  String buttonBtext = "";
  String buttonCtext = "";
  String buttonDtext = "";

  Future<void> loadQuestions() async {
    liveQuestions = questions[questionCount];
    flagPhotoName = liveQuestions.flag_photo;
    wrongOptions = await WorldFlagsDao().getFalseFlags(liveQuestions.flag_id);

    allOptions.clear();
    allOptions.add(liveQuestions);
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
    questions = await WorldFlagsDao().getFlags();
    loadQuestions();
  }

  void questionCountController() async {
    questionCount = questionCount + 1;

    if (questionCount != 10) {
      loadQuestions();
    } else {
      Navigator.pushReplacement(
          (this.context),
          MaterialPageRoute(
              builder: (context) => ResultPage(
                    correctAnswer: correctCount,
                  )));
    }
  }

  void correctAnswerControl(String buttonText) {
    if (liveQuestions.flag_name == buttonText) {
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
                color: Color(0xffEC8B6B),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPageUp()));
                      },
                      icon: Icon(
                        Icons.close,
                        color: mainTextColor,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                Material(
                  elevation: 20,
                  child: Container(
                    height: size.height / 5,
                    width: size.width / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("$flagPhotoName"),
                        fit: BoxFit.cover,
                      ),
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
                      countryName: buttonCtext,
                      fonk: () {
                        correctAnswerControl(buttonCtext);
                        questionCountController();
                      },
                    ),
                    QuizAnswerButton(
                      size: size,
                      countryName: buttonDtext,
                      fonk: () {
                        correctAnswerControl(buttonDtext);
                        questionCountController();
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
