import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:poltergeistwallet/components/alert_dialog_component.dart';
import 'package:poltergeistwallet/components/square_button.dart';
import 'package:poltergeistwallet/constants.dart';
import 'package:poltergeistwallet/model/wallet_info.dart';
import 'package:poltergeistwallet/screens/create_wallet_screen.dart';
import 'package:poltergeistwallet/screens/manage_screen.dart';
import 'package:poltergeistwallet/screens/settings_screen.dart';
import 'package:poltergeistwallet/components/wallet_list_widget.dart';

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
  List<WalletInfo> _walletInfoList;

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

    //mock new data for walletList
    getWalletList();

    print('init state print');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [kPrimaryColor, kDarkSecondaryColor])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Text('Poltergeist Wallet', style: TextStyle(fontSize: 40.0, color: Colors.white),),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SettingsScreen.id);
                      },
                      child: RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
                        child: Hero(
                          tag: SettingsScreen.heroTag,
                          child: Container(
                            width: _animation.value * 40.0,
                            child: Image.asset(kSettingsIcon),
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
                SizedBox(height: 30.0,),
                Expanded(
                  child: Container(
                    decoration: getBorderRadiusGeometry(Colors.lightBlue),
                    child: Column(
                      children: [
                        Expanded(
                          child:  Container(
                            padding: EdgeInsets.all(30.0),
                            child: WalletListWidget(_walletInfoList),
                          ),
                        ),
                        Container(
                            decoration: getBorderRadiusGeometry(Colors.white),
                            height: 200,
                            padding: EdgeInsets.all(30.0),
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
                        ),
                      ],
                    ),
                  ),
                )

              ]),
        ),
      ),
    );
  }

  void getWalletList() {
    _walletInfoList = [];

    for (var i = 0; i < 15; i++) {
      _walletInfoList.add(new WalletInfo('Personal Wallet $i'));
    }
  }

  BoxDecoration getBorderRadiusGeometry(Color frameColor) {
    return BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), color: frameColor);
  }
}


