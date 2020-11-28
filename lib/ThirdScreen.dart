import 'dart:math';

import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int savings = 69;
  @override

  List<String> advice = [
    "Try harder",
    "Stop buying food",
    "You have too many mechanical keyboards",
    "Just get a job",
    "Pull up your bootstraps",
    "Stop buying avocado toast"
  ];

  String savingsAdvice = "Ask for advice";

  void getSavingsAdvice() {
    setState(() {
      savingsAdvice = advice[Random().nextInt(advice.length)];
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to the save zone'),
      ),
      body: Container(
        decoration: BoxDecoration(
         color: Colors.red,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text('You have saved £' + savings.toString() + ' pounds!'),
          ),
          RaisedButton(
              child: Text('Press this button for savings advice!'),
              onPressed: getSavingsAdvice),
          Container(
            color: Colors.redAccent,
            width: 250,
            height: 250,
            child: Text(savingsAdvice),
            alignment: Alignment.center,
          )
        ],
      ),
      )
    );
  }
}
