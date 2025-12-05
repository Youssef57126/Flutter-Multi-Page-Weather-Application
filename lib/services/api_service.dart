import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_keys.dart';
import '../models/weather_model.dart';

class ApiService {
  Future<WeatherModel> getWeatherByCity(
    String city, {
    String unit = "metric",
  }) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$openWeatherApiKey&units=$unit";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("City not found");
    }
  }
}
