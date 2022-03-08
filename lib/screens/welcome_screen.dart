import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:poltergeistwallet/components/alert_dialog_component.dart';
import 'package:poltergeistwallet/components/gradient_theme.dart';
import 'package:poltergeistwallet/components/square_button.dart';
import 'package:poltergeistwallet/constants.dart';
import 'package:poltergeistwallet/model/wallet_info.dart';
import 'package:poltergeistwallet/model/address_type.dart';
import 'package:poltergeistwallet/screens/create_wallet_screen.dart';
import 'package:poltergeistwallet/screens/manage_screen.dart';
import 'package:poltergeistwallet/screens/settings_screen.dart';
import 'package:poltergeistwallet/components/wallet_list_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
  var collection = FirebaseFirestore.instance.collection('wallet');
  TextEditingController nameController = TextEditingController();
  bool showSpinner = false;


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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          decoration: GradientBackground().gradientBoxDecoration(),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      SizedBox(),
                      Text('Poltergeist Wallet', style: TextStyle(fontSize: 36.0, color: Colors.white,),),
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
                          SizedBox(height: 20,),
                          Text('Wallet List [Phantasma, Neo, Ethereum, Binance Smart Chain]', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                          Expanded(
                            child:  Container(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),

                              child: WalletListWidget(_walletInfoList),
                            ),
                          ),
                          Container(
                              decoration: getBorderRadiusGeometry(Colors.white),
                              height: 200,
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
                                        AlertDialogResuable.showAlertDialog(context, updateWalletObject, nameController);
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
      ),
    );
  }

  void getWalletList() async {
    // dimissSpinnerAction(true);

    _walletInfoList = [];
    
    var docSnapshot = await collection.doc('getWallets').get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data();
      var result = data['wallet'];
      List<AddressType> addressTypeList = [];

      List.from(result).forEach((element){
        var name = element['name'];
        var address = element['address'];

        print(address);

        List.from(address).forEach((addressElement) {
          print(addressElement);
          addressTypeList.add(AddressType().fromJson(addressElement));
        });

        _walletInfoList.add(new WalletInfo(name: name, addressType: addressTypeList));
      });
    } else {
      _walletInfoList.clear();
    }

    // dimissSpinnerAction(false);
  }

  void dimissSpinnerAction(bool currentState) {
    setState(() {
      showSpinner = currentState;
    });
  }

  void updateWalletObject() async {
    List<AddressType> addressType = [];
    for(var i = 0; i < 2; i++) {
      addressType.add(new AddressType(address: 'mainnet address + $i'));
    }

    if(nameController.text.isNotEmpty) {
      await collection.doc('getWallets').update({'wallet': FieldValue.arrayUnion([new WalletInfo(name: nameController.text, addressType: addressType).toJson()])});
    }

    Navigator.pop(context);
  }

  BoxDecoration getBorderRadiusGeometry(Color frameColor) {
    return BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), color: frameColor);
  }
}


  