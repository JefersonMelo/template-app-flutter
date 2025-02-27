import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterService extends ChangeNotifier {
  static const keyCounter = 'counter';
  int _value = 0;
  int get value => _value;

  CounterService({SharedPreferences? prefs}) {
    _init(prefs);
  }

  Future<void> _init(SharedPreferences? prefs) async {
    final prefs = await SharedPreferences.getInstance();
    _value = prefs.getInt(keyCounter) ?? 0;
    notifyListeners();
  }

  Future<void> increment() async {
    final prefs = await SharedPreferences.getInstance();
    _value = (prefs.getInt(keyCounter) ?? 0) + 1;
    await prefs.setInt(keyCounter, _value);
    notifyListeners();
  }
}
