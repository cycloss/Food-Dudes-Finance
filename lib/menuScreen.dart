import 'package:flutter/material.dart';
import 'package:food_dudes_finance/MartinScreen.dart';
import 'package:food_dudes_finance/ThirdScreen.dart';
import 'package:food_dudes_finance/demoScreen.dart';
import 'package:food_dudes_finance/tedScreen.dart';
import 'package:food_dudes_finance/StonksScreen.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  List<NameAndRoute> _nameAndRoutes = [
    NameAndRoute(name: 'Ted', screen: TedScreen()),
    NameAndRoute(name: 'Mass', screen: ThirdScreen()),
    NameAndRoute(name: 'Alex', screen: StonksScreen()),
    NameAndRoute(name: 'Demo', screen: DemoClass('Food dudes app message')),
    NameAndRoute(name: 'MartinScreen', screen:MartinScreen())

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: generateTeamButtons(context),
        ),
      ),
    );
  }

  List<Widget> generateTeamButtons(BuildContext c) {
    return _nameAndRoutes
        .map((nameRouteBundle) =>
            teamButton(nameRouteBundle.name, nameRouteBundle.screen, c))
        .toList();
  }

  Widget teamButton(String name, Widget screen, BuildContext c) {
    return RaisedButton(
      padding: EdgeInsets.all(50),
      color: Colors.blue,
      child: Text(name),
      onPressed: () {
        Navigator.push(c, MaterialPageRoute(builder: (c) => screen));
      },
    );
  }
}

class NameAndRoute {
  NameAndRoute({@required this.name, @required this.screen});
  String name;
  Widget screen;
}
