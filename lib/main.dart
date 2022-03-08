import 'package:flutter/material.dart';
import 'package:poltergeistwallet/screens/create_wallet_screen.dart';
import 'package:poltergeistwallet/screens/import_wallet_screen.dart';
import 'package:poltergeistwallet/screens/manage_screen.dart';
import 'package:poltergeistwallet/screens/settings_screen.dart';
import 'package:poltergeistwallet/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "XXX",
      appId: "XXX",
      messagingSenderId: "XXX",
      projectId: "poltergeistwalletdata",
    ),
  );
  runApp(PoltergeistWallet());
}

class PoltergeistWallet extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
