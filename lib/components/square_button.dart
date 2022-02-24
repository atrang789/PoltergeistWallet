import 'package:flutter/material.dart';
import 'package:poltergeistwallet/constants.dart';

class SquareButton extends StatelessWidget {
  SquareButton({@required this.onPressed, @required this.buttonTitle});

  final Function onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(3.0),
      fillColor: Colors.lightBlue,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kMediumButtonTextStyle,
          ),
        ),
        width: double.infinity,
        height: kBottomButtonHeight,
      ),
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }

}