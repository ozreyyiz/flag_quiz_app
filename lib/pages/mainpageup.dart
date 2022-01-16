import 'package:flag_quiz/pages/quizpage.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Welcome the Quiz",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  MainPageBox(
                    quizTypeBoxHeight: quizTypeBoxHeight,
                    boxColorOne: Color(0xff5870EC),
                    boxColorTwo: Color(0xff08BAFE),
                    imagePath:
                        "https://cdn.pixabay.com/photo/2012/04/23/16/11/stars-38740_960_720.png",
                  ),
                  MainPageBox(
                    quizTypeBoxHeight: quizTypeBoxHeight,
                    boxColorOne: Color(0xffED6E9F),
                    boxColorTwo: Color(0xffEC8B6B),
                    imagePath:
                        "https://cdn.pixabay.com/photo/2016/10/18/20/18/international-1751293_960_720.png",
                  ),
                  //      Color(0xffA48ED1),
                  //     Color(0xffF9C0EA),
                  MainPageBox(
                    quizTypeBoxHeight: quizTypeBoxHeight,
                    boxColorOne: Color(0xffA48ED1),
                    boxColorTwo: Color(0xffF9C0EA),
                    imagePath:
                        "https://cdn.pixabay.com/photo/2013/07/12/17/18/colosseum-151985__340.png",
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
