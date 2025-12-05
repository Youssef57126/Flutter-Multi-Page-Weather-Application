import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String unit = "metric";

  SettingsProvider() {
    loadUnit();
  }

  void changeUnit(String newUnit) {
    unit = newUnit;
    saveUnit();
    notifyListeners();
  }

  Future<void> saveUnit() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("unit", unit);
  }

  Future<void> loadUnit() async {
    final prefs = await SharedPreferences.getInstance();
    unit = prefs.getString("unit") ?? "metric";
    notifyListeners();
  }
}
