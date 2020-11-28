import 'package:flutter/material.dart';

class DemoClass extends StatelessWidget {
  String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo screen'),
      ),
      body: Text(message),
    );
  }

  DemoClass(String message) {
    this.message = message;
  }
}
