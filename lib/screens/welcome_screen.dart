import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:poltergeistwallet/components/alert_dialog_component.dart';
import 'package:poltergeistwallet/components/square_button.dart';
import 'package:poltergeistwallet/constants.dart';
import 'package:poltergeistwallet/screens/create_wallet_screen.dart';
import 'package:poltergeistwallet/screens/import_wallet_screen.dart';
import 'package:poltergeistwallet/screens/manage_screen.dart';
import 'package:poltergeistwallet/screens/settings_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  final String _createWalletText = 'Create New Wallet';
  final String _importWalletText = 'Import Existing Wallet';
  final String _manageButtonText = 'Manage';
  final double _sizedBoxHeight = 5;

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1), lowerBound: 0.2);

    _animation = CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // mainAxisAlignment: MainAxisAlignment.end;
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SettingsScreen.id);
                  },
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
                    child: Hero(
                      tag: SettingsScreen.heroTag,
                      child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: _animation.value * 50.0,
                        child: Image.asset(kSettingsIcon),
                      ),
                    ),
                  ),
                ),

                //Insert list here

                Expanded(
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(20.0),
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
                                AlertDialogResuable.showAlertDialog(context);
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
      ),
    );
  }
}
