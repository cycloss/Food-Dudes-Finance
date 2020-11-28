import 'package:flutter/material.dart';

class DemoClass extends StatelessWidget {
  int accountId;
  int phoneNumber;
  int developerId;
  int creditScore;
  String firstName;
  String currencyCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account info'),
      ),
      body: Text(firstName),
    );
  }

  DemoClass(String firstName) {
    this.firstName = firstName;
  }
}