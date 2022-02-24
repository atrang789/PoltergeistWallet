import 'package:flutter/material.dart';

const kBottomButtonHeight = 20.0;

//App Colors
const kPrimaryColor = Color(0xFF4CC1EA);
const kSecondaryColor = Color(0xFF0077B7);
const kDarkSecondaryColor = Color(0xFF006599);

//Styles
const kMediumButtonTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.normal,
  color: Colors.white
);

const kLabelTextSyle = TextStyle(fontSize: 18, color: Colors.white, fontWeight:  FontWeight.normal);

const kSettingsIcon = 'images/setting_icon.png';

//Text
const String kSettingBackup = 'Back up your seed phrase!';
const String kWarning = 'Warning';
const String kSettingWarningDescription = 'For your own safety, write down these words on a piece of paper and store it safely and hidden. These words serve as a backup of your wallet.  Without a backup, it is impossible to recover your private key, and any funds will be lost if something happens to this device';
const String kWalletImportDesc = 'Supported inputs: \n • 12/24 word seed phrase \n • Private key (HEX format) \n • Private key (WIF format) \n • Encrypted private key (NEP2)';

//Button Text
const String kButtonCopy = 'Copy to clipboard';
const String kButtonContinue = 'Continue';
const String kButtonCancel = 'Cancel';
const String kButtonSubmit = 'Submit';
const String kButtonBalances = 'Balances';
const String kButtonHistory = 'History';
const String kButtonAccount = 'Account';
const String kButtonExit = 'Exit';
const String kButtonExplore = 'Explore';