import 'package:flutter/material.dart';

class  ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('ThirdScreen'),),
        body: Center(
      child: Column(
        children: [
          Image(
        image: AssetImage('images/logo.png'),
    )
      ],
    ),
    ),
    );
  }
}
