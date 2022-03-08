import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poltergeistwallet/model/wallet_info.dart';

class ManageScreen extends StatefulWidget {
  static String id = 'manage_screen';

  @override
  _ManageScreen createState() => _ManageScreen();
}

class _ManageScreen extends State<ManageScreen> {
  String manageText = 'Manage Screen';

  final CollectionReference _products =
  FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:[
          Text('From Firestore'),
          FloatingActionButton(onPressed: (){
            _updateObject();
          },),
          SizedBox(height: 20,),
          FloatingActionButton(onPressed: (){
            getDataFromCloud();
          },),
        ],
      ),
    );
  }

  Future<void> _updateObject([DocumentSnapshot documentSnapshot]) async {
    WalletInfo walletInfo = new WalletInfo(name: 'Andrew Trang is cool');
    await _products.doc('FOdFiG5UNdK1y0M9F18F').update(walletInfo.toJson());
    _products.snapshots();
  }

  void getDataFromCloud() async {
    var collection = FirebaseFirestore.instance.collection('wallet');
    var docSnapshot = await collection.doc('whUlKRbo3dqSTi9OQxhy').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data();
      var value = data['seeds']; // <-- The value you want to retrieve.
      // Call setState if needed.
      print(value);
    } else {
      print('error api');
    }
  }
}