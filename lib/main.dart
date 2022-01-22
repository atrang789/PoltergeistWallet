import 'package:flutter/material.dart';
import 'package:poltergeistwallet/screens/create_wallet_screen.dart';
import 'package:poltergeistwallet/screens/import_wallet_screen.dart';
import 'package:poltergeistwallet/screens/manage_screen.dart';
import 'package:poltergeistwallet/screens/settings_screen.dart';
import 'package:poltergeistwallet/screens/welcome_screen.dart';

void main() {
  runApp(PoltergeistWallet());
}

class PoltergeistWallet extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        CreateWalletScreen.id: (context) => CreateWalletScreen(),
        ImportWalletScreen.id: (context) => ImportWalletScreen(),
        ManageScreen.id: (context) => ManageScreen(),
        SettingsScreen.id: (context) => SettingsScreen(),
      },
    );
  }
}
