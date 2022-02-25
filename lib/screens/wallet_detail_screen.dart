import 'package:flutter/material.dart';
import 'package:poltergeistwallet/components/small_square_button.dart';
import 'package:poltergeistwallet/components/square_button.dart';
import 'package:poltergeistwallet/constants.dart';
import 'package:poltergeistwallet/components/gradient_theme.dart';

class WalletDetail extends StatefulWidget {
  @override
  _WalletDetailState createState() => _WalletDetailState();
}

class _WalletDetailState extends State<WalletDetail> {
  String chosenWalletAddress = 'Select Wallet';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: GradientBackground().gradientBoxDecoration(),
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Text('Account Details', style: kLabelTextSyle,),
            SizedBox(height: 20,),
            Text('Wallet Type', style: kLabelTextSyle,),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(child: ImageIconCard('images/phantasma_icon_3.png'), onTap: (){
                  setState(() {
                    chosenWalletAddress = 'Phantasma Wallet';
                  });
                },),
                GestureDetector(child: ImageIconCard('images/eth_icon.png'), onTap: (){
                  setState(() {
                    chosenWalletAddress = 'Ethereum Wallet';
                  });
                },),
                GestureDetector(child: ImageIconCard('images/neo_icon.png'), onTap: (){
                  setState(() {
                    chosenWalletAddress = 'Neo Wallet';
                  });
                },),
                GestureDetector(child: ImageIconCard('images/bnb_icon_2.png'), onTap: (){
                  setState(() {
                    chosenWalletAddress = 'Binance Wallet';
                  });
                },)
              ],
            ),
            SizedBox(height: 30,),
            // Image.asset(name),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: <Widget> [
                  Text(chosenWalletAddress, style: kLabelTextSyle,),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 200,
                      width: 200,
                      child: Text('QR \nCODE', textAlign: TextAlign.center, style: TextStyle(fontSize: 50),),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SmallSquareButton(buttonTitle: kButtonCopy, onPressed: (){}),
                      SizedBox(width: 10,),
                      SmallSquareButton(buttonTitle: kButtonExplore, onPressed: (){}),
                    ],
                  ),
                ]
              ),
            ),
            Expanded(child: Container()),
            SquareButton(
              onPressed: () {},
              buttonTitle: kButtonBalances,
            ),
            SquareButton(
              onPressed: () {},
              buttonTitle: kButtonHistory,
            ),
            SquareButton(
              onPressed: () {},
              buttonTitle: kButtonAccount,
            ),
            SquareButton(
              onPressed: () {
                Navigator.pop(context);
              },
              buttonTitle: kButtonExit,
            ),
          ],
        ),
      ),
    );
  }

  Card ImageIconCard(String path) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Image.asset(
        path,
        width: 60,
        height: 60,
      ),
    );
  }
}
