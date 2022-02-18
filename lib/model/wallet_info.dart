
import 'package:poltergeistwallet/model/address_type.dart';

class WalletInfo {
  WalletInfo(this.walletName);

  String walletName;
  List<AddressType> addressType;
}