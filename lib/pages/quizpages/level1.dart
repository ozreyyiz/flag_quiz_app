import 'package:flag_quiz/constant.dart';
import 'package:flutter/material.dart';

class Level1 extends StatefulWidget {
  Level1({Key? key}) : super(key: key);

  @override
  _Level1State createState() => _Level1State();
}

class _Level1State extends State<Level1> {
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
                color: Color(0xff5870EC),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.close),
                      iconSize: 40,
                      color: mainTextColor,
                    )
                  ],
                ),
                Container(
                  height: size.height / 5,
                  width: size.width,
                  child: Image.asset("assets/turkey.png",fit: BoxFit.cover,),
                ),
                Column(
                  children: [],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
