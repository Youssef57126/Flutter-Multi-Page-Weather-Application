import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> favoriteCities = [];

  FavoritesProvider() {
    loadFavorites();
  }

  void addFavorite(String city) {
    if (!favoriteCities.contains(city)) {
      favoriteCities.add(city);
      saveFavorites();
      notifyListeners();
    }
  }

  void removeFavorite(String city) {
    favoriteCities.remove(city);
    saveFavorites();
    notifyListeners();
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList("favorites", favoriteCities);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    favoriteCities = prefs.getStringList("favorites") ?? [];
    notifyListeners();
  }
}
