import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int counter = 0;

  void changeCounterValue(String value) {
    if (value == 'u') {
      counter++;
    } else
      counter--;
    notifyListeners();
  }
}
