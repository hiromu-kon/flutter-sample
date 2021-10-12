import 'package:flutter/cupertino.dart';

class TweetProvider extends ChangeNotifier {
  List<String> list = [];

  void addList($value) {
    list.add($value);
    notifyListeners();
  }
}
