import 'package:flag_quiz/constant.dart';
import 'package:flutter/material.dart';

class QuizAnswerButton extends StatefulWidget {
  const QuizAnswerButton({
    Key? key,
    required this.size,
    required this.countryName,required this.fonk,
  }) : super(key: key);

  final Size size;
  final String countryName;
  final VoidCallback fonk;

  @override
  State<QuizAnswerButton> createState() => _QuizAnswerButtonState();
}

class _QuizAnswerButtonState extends State<QuizAnswerButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(20),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              fixedSize: MaterialStateProperty.all(
                  Size(widget.size.width / 1.5, widget.size.height / 12)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)))),
          onPressed: widget.fonk,
          child: Text(
            widget.countryName,
            style: TextStyle(
              color: level1mainColor,
              fontSize: 20,
              fontFamily: "Lato",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
