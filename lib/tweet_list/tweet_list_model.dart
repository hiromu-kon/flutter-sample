import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class TweetListModel extends ChangeNotifier {
  String tweet = "";
  String time = "";
  List<String>? tweetList;

  final Stream<QuerySnapshot> _tweetStream =
      FirebaseFirestore.instance.collection('tweet').snapshots();

  void fetchTweetList() {
    _tweetStream.listen((QuerySnapshot snapshot) {});

    notifyListeners();
  }
}
