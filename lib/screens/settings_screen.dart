import 'package:flutter/widgets.dart';
import 'package:poltergeistwallet/constants.dart';

class SettingsScreen extends StatefulWidget {
  static String id = 'settings_screen';
  static String heroTag = 'setting_icon';

  @override
  _SettingsScreen createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: SettingsScreen.heroTag,
        child: Container(
          height: 200.0,
          child: Image.asset(kSettingsIcon),
        ),
      ),
    );
  }
}