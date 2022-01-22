import 'dart:html';
import 'package:flutter/widgets.dart';

class ImportWalletScreen extends StatefulWidget {
  static String id = 'import_wallet_screen';

  @override
  _ImportWalletScreen createState() => _ImportWalletScreen();
}

class _ImportWalletScreen extends State<ImportWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Import Wallet Screen'),
    );
  }
}