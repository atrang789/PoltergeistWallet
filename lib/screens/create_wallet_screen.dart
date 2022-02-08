import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poltergeistwallet/constants.dart';
import 'package:poltergeistwallet/components/square_button.dart';

class CreateWalletScreen extends StatefulWidget {
  static String id = 'create_wallet_screen';

  @override
  _CreateWalletScreen createState() => _CreateWalletScreen();
}

class _CreateWalletScreen extends State<CreateWalletScreen> {
  final double _sizedBoxHeight = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child:
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.ltr,
          children: [
            AnimatedTextKit(animatedTexts: [
              TypewriterAnimatedText(kSettingBackup,
                textStyle: TextStyle(color: Colors.blue, fontSize: 30.0),
              ),
            ]),
            SizedBox(height: _sizedBoxHeight),
            Text(
              '12 random words',
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
              onPressed: () {},
              buttonTitle: kButtonContinue,
            ),
          ],
        ),
      ),
    );
  }
}
