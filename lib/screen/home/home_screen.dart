import 'package:flutter/material.dart';
import 'package:internet_bank/screen/home/home_information.dart';

import 'home_actions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _cardSize = _screenSize.width - 30;
    var _accountName = TextEditingController();
    _accountName.text = "Bem Vindo(a)!R";


    return Scaffold(
      backgroundColor: Color.fromRGBO(85, 175, 246, 1),
      body: Padding(
        padding:
            EdgeInsets.only(left: 8.0, right: 8.0, top: 80.0, bottom: 16.0),
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              width: _cardSize,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildTitle(_accountName),
                    InformationHome(
                      saldoConta: "480,00",
                      valorFatura: "200,00",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: ActionHome(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildTitle(TextEditingController _accountName) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          _accountName.text,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
