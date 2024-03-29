import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetSeedPhrase extends StatelessWidget {
  final String documentId;

  GetSeedPhrase(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('getGeneratedWords');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data() as Map<String, dynamic>;
          return Text(data['text']);
        }

        return Text("loading");
      },
    );
  }
}