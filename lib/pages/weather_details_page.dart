import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/weather_provider.dart';
import '../provider/favorites_provider.dart';
import '../utils/format_time.dart';

class WeatherDetailsPage extends StatelessWidget {
  const WeatherDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final weather = context.watch<WeatherProvider>().weather;
    final favProv = context.watch<FavoritesProvider>();

    if (weather == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Details")),
        body: const Center(
          child: Text("No weather data", style: TextStyle(color: Colors.white)),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.2),
        elevation: 0,
        centerTitle: true,
        title: Text(weather.city),
        actions: [
          IconButton(
            onPressed: () => favProv.addFavorite(weather.city),
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4A90E2), Color(0xFF145A9E)],
          ),
        ),

        child: ListView(
          children: [
            Center(
              child: Image.network(
                "https://openweathermap.org/img/wn/${weather.icon}@4x.png",
                height: 150,
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: Text(
                "${weather.temp}°",
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            Center(
              child: Text(
                weather.description,
                style: const TextStyle(fontSize: 22, color: Colors.white70),
              ),
            ),

            const SizedBox(height: 30),

            _buildGlassTile(
              title: "Feels Like",
              value: "${weather.feelsLike}°",
            ),
            _buildGlassTile(title: "Humidity", value: "${weather.humidity}%"),
            _buildGlassTile(title: "Wind Speed", value: "${weather.wind} m/s"),
            _buildGlassTile(
              title: "Sunrise",
              value: formatUnixTime(weather.sunrise, weather.timezone),
            ),
            _buildGlassTile(
              title: "Sunset",
              value: formatUnixTime(weather.sunset, weather.timezone),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlassTile({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: ListTile(
            tileColor: Colors.white.withOpacity(0.2),
            title: Text(title, style: const TextStyle(color: Colors.white)),
            trailing: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
