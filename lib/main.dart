import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/weather_provider.dart';
import 'provider/favorites_provider.dart';
import 'provider/settings_provider.dart';

import 'pages/home_page.dart';
import 'pages/weather_details_page.dart';
import 'pages/favorites_page.dart';
import 'pages/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Weather App",
        theme: ThemeData.light(),
        initialRoute: "/",
        routes: {
          "/": (_) => const HomePage(),
          "/details": (_) => const WeatherDetailsPage(),
          "/favorites": (_) => const FavoritesPage(),
          "/settings": (_) => const SettingsPage(),
        },
      ),
    );
  }
}
