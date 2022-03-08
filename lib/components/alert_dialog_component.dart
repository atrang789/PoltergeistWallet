import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poltergeistwallet/constants.dart';

class AlertDialogResuable {
  static Future<void> showAlertDialog (BuildContext _context, Function onPress, TextEditingController textEditingController) async {
    return showDialog(
        context: _context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              'Wallet Import',
              style: TextStyle(color: Colors.blue, fontSize: 16.0),
            ),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    Text(
                      kWalletImportDesc,
                      style: TextStyle(color: Colors.blue, fontSize: 16.0),
                    ),
                    TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(),
                      maxLines: 5,
                      minLines: 3,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                  child: Text(kButtonCancel),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ElevatedButton(
                  child: Text(kButtonSubmit),
                  onPressed: onPress,
              )
            ],
          );
        });
  }


}