import 'package:flutter/widgets.dart';
import 'package:poltergeistwallet/constants.dart';

class GradientBackground {
  GradientBackground();

  BoxDecoration gradientBoxDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [kPrimaryColor, kDarkSecondaryColor]));
  }
}