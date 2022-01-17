import 'package:flag_quiz/constant.dart';
import 'package:flutter/material.dart';

class MainPageBox extends StatelessWidget {
  const MainPageBox({
    Key? key,
    required this.quizTypeBoxHeight,
    required this.boxColorOne,
    required this.boxColorTwo,
    required this.imagePath,
    required this.quizTypeBoxWidth,
    required this.textLevel,
    required this.textHeader,required this.targetPage,
  }) : super(key: key);

  final double quizTypeBoxHeight;
  final Color boxColorOne;
  final Color boxColorTwo;
  final String imagePath;
  final double quizTypeBoxWidth;
  final String textLevel;
  final String textHeader;
  final Widget targetPage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GestureDetector(onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>targetPage));
          },
            child: Container(
              height: quizTypeBoxHeight,
              width: quizTypeBoxWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [
                  boxColorOne,
                  boxColorTwo,
                ]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0), //(x,y)
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "level $textLevel",
                      style: TextStyle(
                          color: mainTextColor, fontFamily: "Lato"),
                    ),
                    Text(
                      textHeader,
                      style: TextStyle(
                          color: mainTextColor,
                          fontFamily: "Lato",
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 70,
            child: Container(
              height: 80,
              width: 100,
              child: Image.network(imagePath),
            ),
          ),
        ],
      ),
    );
  }
}
