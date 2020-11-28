import 'dart:math';

import 'package:flutter/material.dart';

class MartinScreen extends StatefulWidget {
  @override
  _MartinScreenState createState() => _MartinScreenState();
}

class _MartinScreenState extends State<MartinScreen> {
  @override
  int savings = 412412;
  List<List<int>> spent = [[243,25,3,4134], [21314,31,35,535], [34252352]];



  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text('Martin\'s screen'),

  ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/logo.png'),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text('hey'),
            )
          ],
        ),

      ),
    );
  }
}
