import 'package:flutter/material.dart';

class SmallSquareButton extends StatelessWidget {
  SmallSquareButton({@required this.onPressed, @required this.buttonTitle});

  final Function onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonTheme(
        child: MaterialButton(
          onPressed: () {},
          child: Flexible(fit: FlexFit.tight, child: Text(buttonTitle)),
          color: Colors.white,
        ),
      ),
    );
  }

}