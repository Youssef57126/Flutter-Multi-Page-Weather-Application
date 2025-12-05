import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/api_service.dart';
import 'settings_provider.dart';
import 'package:provider/provider.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weather;
  bool isLoading = false;
  String? error;

  Future<void> fetchWeather(BuildContext context, String city) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final unit = context.read<SettingsProvider>().unit;

      weather = await ApiService().getWeatherByCity(city, unit: unit);
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
