
import 'package:flutter/cupertino.dart';
import 'package:poltergeistwallet/model/address_type.dart';

class WalletInfo {
  WalletInfo({@required this.name, this.addressType});

  final String name;
  List<AddressType> addressType;

  WalletInfo fromJson(Map<String, Object> json) {
    return WalletInfo(
      name: json['name'] as String,
      addressType: json['address'],
    );
  }

  Map<String,dynamic> toJson() {
    return {
      'name': name,
      'address': addressType.map((addressType) => addressType.toJson()),
    };
  }
}