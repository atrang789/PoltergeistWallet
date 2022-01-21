import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:poltergeistwallet/components/square_button.dart';
import 'package:poltergeistwallet/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';


  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final String _createwallet = 'Create Wallet';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [kPrimaryColor, kDarkSecondaryColor]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text('POLTERGEIST WALLET',)),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SquareButton(
                buttonTitle: _createwallet,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]
        ),
      ),
    );

  }
}