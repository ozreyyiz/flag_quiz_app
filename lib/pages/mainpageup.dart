import 'package:flag_quiz/pages/quizpage.dart';
import 'package:flag_quiz/pages/quizpages/level1.dart';
import 'package:flag_quiz/pages/quizpages/level2.dart';
import 'package:flag_quiz/pages/quizpages/level3.dart';
import 'package:flag_quiz/widgets/main_page_box.dart';
import 'package:flutter/material.dart';

class MainPageUp extends StatefulWidget {
  MainPageUp({Key? key}) : super(key: key);

  @override
  _MainPageUpState createState() => _MainPageUpState();
}

class _MainPageUpState extends State<MainPageUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double quizTypeBoxHeight = size.height / 6;
    double quizTypeBoxWidth = size.width / 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome the Quiz",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xffED6E9F),
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MainPageBox(
                    quizTypeBoxHeight: quizTypeBoxHeight,
                    quizTypeBoxWidth: quizTypeBoxWidth,
                    textHeader: "Europe",
                    textLevel: "1",
                    boxColorOne: Color(0xff5870EC),
                    boxColorTwo: Color(0xff08BAFE),
                    imagePath:
                        "https://cdn.pixabay.com/photo/2012/04/23/16/11/stars-38740_960_720.png",
                    targetPage: Level1(),
                  ),
                  MainPageBox(
                    quizTypeBoxHeight: quizTypeBoxHeight,
                    quizTypeBoxWidth: quizTypeBoxWidth,
                    textHeader: "World",
                    textLevel: "2",
                    boxColorOne: Color(0xffED6E9F),
                    boxColorTwo: Color(0xffEC8B6B),
                    imagePath:
                        "https://cdn.pixabay.com/photo/2016/10/18/20/18/international-1751293_960_720.png",
                    targetPage: Level2(),
                  ),
                  //      Color(0xffA48ED1),
                  //     Color(0xffF9C0EA),
                  MainPageBox(
                    quizTypeBoxHeight: quizTypeBoxHeight,
                    quizTypeBoxWidth: quizTypeBoxWidth,
                    textHeader: "Empires",
                    textLevel: "3",
                    boxColorOne: Color(0xffA48ED1),
                    boxColorTwo: Color(0xffF9C0EA),
                    imagePath:
                        "https://cdn.pixabay.com/photo/2013/07/12/17/18/colosseum-151985__340.png",
                    targetPage: Level3(),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
