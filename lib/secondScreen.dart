import 'dart:math';

import 'ThirdScreen.dart';

import 'package:flutter/material.dart';
import 'package:food_dudes_finance/ThirdScreen.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _counter = 0;

  List<String> advice = [
    "try again",
    "maybe",
    "definitely",
    "probably not",
    "no"
  ];

  String currentAdvice = "Ask the 8 ball";

  void askTheEightBall() {
    setState(() {
      currentAdvice = advice[Random().nextInt(advice.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                child: Text('Ask the eight ball'),
                onPressed: askTheEightBall,
              ),
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                padding: EdgeInsets.all(100),
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.blue,
                  child: Text(
                    'Advice: ${currentAdvice}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              RaisedButton(
                  child: Text('Return to previous'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              RaisedButton(
                child: Text('Go to next screen'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThirdScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
