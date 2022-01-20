import 'package:flutter/widgets.dart';
import 'package:poltergeistwallet/constants.dart';

class GradientBackground extends StatelessWidget {
  GradientBackground({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [kPrimaryColor, kDarkSecondaryColor]
            ),
          ),
        ),
      ],
    );
  }
}