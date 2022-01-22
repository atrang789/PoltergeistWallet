import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:poltergeistwallet/components/square_button.dart';
import 'package:poltergeistwallet/constants.dart';
import 'package:poltergeistwallet/screens/create_wallet_screen.dart';
import 'package:poltergeistwallet/screens/import_wallet_screen.dart';
import 'package:poltergeistwallet/screens/manage_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final String _createWalletText = 'Create New Wallet';
  final String _importWalletText = 'Import Existing Wallet';
  final String _manageButtonText = 'Manage';
  final double _sizedBoxHeight = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [kPrimaryColor, kDarkSecondaryColor])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: Text(
          'POLTERGEIST WALLET',
        )),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //Insert list here
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: SquareButton(
                            buttonTitle: _createWalletText,
                            onPressed: () {
                              Navigator.pushNamed(context, CreateWalletScreen.id);
                            },
                          ),
                        ),
                        SizedBox(height: _sizedBoxHeight),
                        Expanded(
                          child: SquareButton(
                            buttonTitle: _importWalletText,
                            onPressed: () {
                              Navigator.pushNamed(context, ImportWalletScreen.id);
                            },
                          ),
                        ),
                        SizedBox(height: _sizedBoxHeight),
                        Expanded(
                          child: SquareButton(
                            buttonTitle: _manageButtonText,
                            onPressed: () {
                              Navigator.pushNamed(context, ManageScreen.id);
                            },
                          ),
                        ),
                      ],
                    )
              )),
            ]),
      ),
    );
  }
}
