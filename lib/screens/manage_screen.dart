import 'package:flutter/widgets.dart';

class ManageScreen extends StatefulWidget {
  static String id = 'manage_screen';

  @override
  _ManageScreen createState() => _ManageScreen();
}

class _ManageScreen extends State<ManageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Manage Screen'),
    );
  }
}