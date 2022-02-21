import 'package:flutter/material.dart';
import 'package:poltergeistwallet/screens/wallet_detail_screen.dart';

class WalletTileWidget extends StatelessWidget {
  WalletTileWidget(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    // var borderRadius = const BorderRadius.only(topRight: Radius.circular(32), bottomRight: Radius.circular(32));

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Colors.white,
      child: ListTile(
        title: Text(name),
        trailing: Icon(Icons.navigate_next),
        // tileColor: Colors.white,
        // shape: RoundedRectangleBorder(borderRadius: borderRadius),
        onTap: () {
            navigateToWalletDetails(context);
          },
      ),
    );
  }

  void navigateToWalletDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WalletDetail(
        ),
      ),
    );
  }
}