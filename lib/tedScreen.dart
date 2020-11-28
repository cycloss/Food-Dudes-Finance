import 'dart:convert';
import 'dart:math';
import 'package:food_dudes_finance/capitalOneAccessor.dart';
import 'ThirdScreen.dart';
import 'package:flutter/material.dart';
import 'package:food_dudes_finance/ThirdScreen.dart';
import 'package:http/http.dart' as http;
import 'apiKey.dart' as keyFile;

class TedScreen extends StatefulWidget {
  @override
  _TedScreenState createState() => _TedScreenState();
}

const String unfortunateAdvice = "oops I just spent your money";

class _TedScreenState extends State<TedScreen> {
  Account account = Account(
      "19713371",
      "Frederica",
      "14124",
      "134514",
      "4142",
      "142124",
      "142412",
      "USD",
      "Groceries",
      "rfodfa@gmail.com",
      "Doe",
      "Adress 8",
      "California",
      "12434",
      "100000");

  List<String> advice = [
    "try again",
    "maybe",
    "definitely",
    "probably not",
    "no",
    unfortunateAdvice
  ];

  String currentAdvice = "Ask the 8 ball";

  void askTheEightBall() {
    setState(() {
      String randAdvice = advice[Random().nextInt(advice.length)];
      if (randAdvice == unfortunateAdvice) {
        spendMoney();
      }
      currentAdvice = randAdvice;
    });
  }

  String boughtItem = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              boughtItem == null
                  ? SizedBox()
                  : Text(
                      'I bought: $boughtItem',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
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

  APIAccessor api = APIAccessor();

  final _transactionCount = 1;

  void spendMoney() {
    print('Spending monaaaaaay');
    final Map<String, String> transactionHeaders = {
      'Authorization': 'Bearer ${keyFile.key}',
      'Content-Type': 'application/json',
      'version': '1.0'
    };

    Uri uri = Uri.tryParse(
        "https://sandbox.capitalone.co.uk/developer-services-platform-pr/api/data/transactions/accounts/${account.accountId}/create");

    http.Request req = http.Request(
      'POST',
      uri,
    );

    req.headers.addAll(transactionHeaders);
    req.body = "{\n    \"quantity\": $_transactionCount\n}";
    req
        .send()
        .then((responseStream) => responseStream.stream.bytesToString())
        .then(
      (value) {
        setState(() {
          if (value == null) {
            return;
          }
          Map<String, dynamic> obj = JsonDecoder().convert(value);
          List<dynamic> transactions = obj['Transactions'];
          Map<String, dynamic> first = transactions[0];
          boughtItem = first['message'];
        });
      },
    );
  }
}
