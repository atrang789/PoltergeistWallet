import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poltergeistwallet/constants.dart';
import 'package:poltergeistwallet/components/square_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateWalletScreen extends StatefulWidget {
  static String id = 'create_wallet_screen';

  @override
  _CreateWalletScreen createState() => _CreateWalletScreen();
}

class _CreateWalletScreen extends State<CreateWalletScreen> {
  final double _sizedBoxHeight = 20;
  String _alertTitle = 'Seed Verification';
  String _alertDescription =
      'To confirm that you have backed up your seed phrase, enter your seed words.';
  String _alertHint = 'Enter your seed words.';
  String _walletWords = '12 random words';
  bool showSpinner = false;
  // FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: [
              AnimatedTextKit(animatedTexts: [
                TypewriterAnimatedText(
                  kSettingBackup,
                  textStyle: TextStyle(color: Colors.blue, fontSize: 30.0),
                ),
              ]),
              SizedBox(height: _sizedBoxHeight),
              Text(
                _walletWords,
                style: TextStyle(color: Colors.blue, fontSize: 30.0),
              ),
              SizedBox(height: _sizedBoxHeight),
              Container(
                padding: EdgeInsets.all(20),
                child: Text('$kWarning\n\n$kSettingWarningDescription'),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              SizedBox(height: _sizedBoxHeight),
              SquareButton(
                onPressed: () {},
                buttonTitle: kButtonCopy,
              ),
              SquareButton(
                onPressed: () {
                  showDialogWithFields();
                },
                buttonTitle: kButtonContinue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDialogWithFields() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              _alertTitle,
              style: TextStyle(color: Colors.blue, fontSize: 16.0),
            ),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    Text(
                      _alertDescription,
                      style: TextStyle(color: Colors.blue, fontSize: 16.0),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: _alertHint,
                        icon: Icon(Icons.lock_sharp),
                      ),
                      maxLines: 5,
                      minLines: 3,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                  child: Text(kButtonCancel),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ElevatedButton(
                  child: Text(kButtonSubmit),
                  onPressed: () {
                    setState(() {
                      showSpinner = true;
                    });
                  })
            ],
          );
        });
  }

  //Firestore
  /*void getNewSeedPhrase() async {
    GetSeedPhrase _getSeedPhrase = GetSeedPhrase('Ucqfzbve4HvLkIwrY9wC');
    _getSeedPhrase.build(context);
  }

  dynamic data;

  Future<dynamic> getData() async {
    final DocumentReference document = _firestore.collection(
        'wallet').doc('whUlKRbo3dqSTi9OQxhy');

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        data = snapshot.data;
        showSpinner = false;
      });
    });
  }*/
}
