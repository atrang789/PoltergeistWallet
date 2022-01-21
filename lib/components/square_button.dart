import 'package:flutter/material.dart';
import 'package:poltergeistwallet/constants.dart';

class SquareButton extends StatelessWidget{
  SquareButton({@required this.onPressed, @required this.buttonTitle});

  final Function onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kMediumButtonTextStyle,
          ),
        ),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
      style: ElevatedButton.styleFrom(
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(4)
        ),
      ),
    );
  }

}