import 'package:flag_quiz/pages/mainpageup.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  int correctAnswer;

  ResultPage({this.correctAnswer = 0});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Result Page",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${widget.correctAnswer} DOĞRU ${10 - widget.correctAnswer} YANLIŞ",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "% ${widget.correctAnswer * 100 / 10} BAŞARI",
              style: TextStyle(fontSize: 30, color: Colors.purpleAccent),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainPageUp()));
                },
                child: Text("Again"))
          ],
        ),
      ),
    );
  }
}
