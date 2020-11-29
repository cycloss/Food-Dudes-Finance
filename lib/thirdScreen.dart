import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'Transaction.dart';


class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

Transaction transaction1 = Transaction(43.4, Category.Entertainment);
Transaction transaction2 = Transaction(12.43, Category.Education);
Transaction transaction3 = Transaction(33.4, Category.Entertainment);
Transaction transaction4 = Transaction(23.54, Category.AutoTransport);
Transaction transaction5 = Transaction(55.4, Category.GiftsDonations);

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

  List<Transaction> transactions = [
    transaction1,
    transaction2,
    transaction3,
    transaction4,
    transaction5
  ];

  String savingsAdvice = "Ask for advice";
  String spending = "hi";

  void getEntertainmentSpending() {
    double a = 0;
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].category == Category.Entertainment) {
        a += transactions[i].amount;
      }
    }
    setState(() {
      spending = "£" +a.toString();
    });
  }

  void getEducationSpending() {
    double a = 0;
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].category == Category.Education) {
        a += transactions[i].amount;
      }
    }
    setState(() {
      spending = "£" +a.toString();
    });
  }

  void getAutoTransportSpending() {
    double a = 0;
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].category == Category.AutoTransport) {
        a += transactions[i].amount;
      }
    }
    setState(() {
      spending = "£" +a.toString();
    });
  }

  double getEntertainmentSpendingValue() {
    double a = 0;
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].category == Category.Entertainment) {
        a += transactions[i].amount;
      }
    }
    return a;
  }

  double getEducationSpendingValue() {
    double a = 0;
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].category == Category.Education) {
        a += transactions[i].amount;
      }
    }
    return a;
  }

  double getAutoTransportSpendingValue() {
    double a = 0;
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].category == Category.AutoTransport) {
        a += transactions[i].amount;
      }
    }
    return a;
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to the save zone'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/money.jpg'),
              repeat: ImageRepeat.repeatY,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child:
                    Text('You have saved £' + savings.toString() + ' pounds!'),
              ),
              RaisedButton(
                  child: Text('How much have I spent on Entertainment?'),
                  onPressed: getEntertainmentSpending),
              RaisedButton(
                  child: Text('How much have I spent on Education?'),
                  onPressed: getEducationSpending),
              RaisedButton(
                  child: Text('How much have I spent on Auto & Transport?'),
                  onPressed: getAutoTransportSpending),
              Container(
                color: Colors.redAccent,
                width: 250,
                height: 250,
                child: Text(spending),
                alignment: Alignment.center,
              ),
              PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections()),
                ),
            ],
          ),
        ));
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final double fontSize = 16;
      final double radius = 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: getEntertainmentSpendingValue(),
            title: 'Entertainment',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: getEducationSpendingValue(),
            title: 'Education',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: getAutoTransportSpendingValue(),
            title: 'Auto & Transport',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}
