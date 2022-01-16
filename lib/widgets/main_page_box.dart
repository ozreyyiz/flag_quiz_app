import 'package:flutter/material.dart';

class MainPageBox extends StatelessWidget {
  const MainPageBox({
    Key? key,
    required this.quizTypeBoxHeight,
    required this.boxColorOne,
    required this.boxColorTwo,
    required this.imagePath,
  }) : super(key: key);

  final double quizTypeBoxHeight;
  final Color boxColorOne;
  final Color boxColorTwo;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: quizTypeBoxHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30)
              ,
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
