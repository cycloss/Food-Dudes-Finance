import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    print("Hello World");
    return Scaffold(
      appBar: AppBar(
        title: Text('Savings Data'),
      ),
      body: Center(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                //Image.asset(
                  //'images/Stonks.jpg',
                  //fit:
                //)

          ]),
        ),
      ),
    );
  }
}
