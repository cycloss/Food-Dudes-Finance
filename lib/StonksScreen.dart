import 'package:flutter/material.dart';

import 'dart:math';

class StonksScreen extends StatefulWidget {
  @override
  _StonksScreenState createState() => _StonksScreenState();
}

class _StonksScreenState extends State<StonksScreen> {
  int savings = 0;
  double custFontSize = 20;

  void randIncrease() {
    setState(() {
      savings = savings + Random().nextInt(1000);
      if (savings.isEven) {
        custFontSize += 3;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/moola.png'),
              fit: BoxFit.scaleDown,
              repeat: ImageRepeat.repeatY,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text("Current Savings: \n",
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontSize: 20, color: Colors.white)),
            ),
            Center(
                child: Text(
                    "£" + savings.toString(), textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: custFontSize, color: Colors.white))
            ),
            ButtonTheme(
              //height: 400.0,
              child: RaisedButton(
                onPressed: randIncrease,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ]),
                  ),
                  child: Text("Mysterious Money\n Maker",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



