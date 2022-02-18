import 'package:flutter/material.dart';
import 'package:poltergeistwallet/components/wallet_tile_widget.dart';
import 'package:poltergeistwallet/model/wallet_info.dart';

class WalletListWidget extends StatefulWidget {
  WalletListWidget(this.walletInfoList);

  List<WalletInfo> walletInfoList;

  @override
  _WalletListStateState createState() => _WalletListStateState();
}

class _WalletListStateState extends State<WalletListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
      return WalletTileWidget(widget.walletInfoList[index].walletName);
    }, itemCount: widget.walletInfoList.length,);
  }
}
