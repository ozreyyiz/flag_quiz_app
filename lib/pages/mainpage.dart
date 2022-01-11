import 'package:flag_quiz/pages/quizpage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Welcome the Quiz",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith((states) =>
                      EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuizPage()));
                },
                child: Text(
                  "Start",
                  style: TextStyle(fontSize: 25),
                )),
          ],
        ),
      ),
    );
  }
}
