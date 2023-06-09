import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkBloc extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List> getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // ignore: no_leading_underscores_for_local_identifiers
    String? _uid = sp.getString('uid');

    final DocumentReference ref = firestore.collection('users').doc(_uid);
    DocumentSnapshot snap = await ref.get();
    List d = snap['loved items'];
    List filteredData = [];

    if (d.isNotEmpty) {
      await firestore
        .collection('contents')
        .where('timestamp', whereIn: d.take(10).toList())
        .limit(10)
        .get()
        .then((QuerySnapshot snap) {
          filteredData = snap.docs;
      });
    }

    notifyListeners();
    return filteredData;
  }
}
