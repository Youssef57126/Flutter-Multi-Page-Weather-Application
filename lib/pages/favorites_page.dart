import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorites_provider.dart';
import '../provider/weather_provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favProv = context.watch<FavoritesProvider>();
    final weatherProv = context.read<WeatherProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.2),
        elevation: 0,
        title: const Text("Favorite Cities"),
        centerTitle: true,
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4A90E2), Color(0xFF145A9E)],
          ),
        ),

        padding: const EdgeInsets.only(top: 100, left: 16, right: 16),

        child: favProv.favoriteCities.isEmpty
            ? const Center(
                child: Text(
                  "No favorite cities yet.",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            : ListView.builder(
                itemCount: favProv.favoriteCities.length,
                itemBuilder: (_, i) {
                  final city = favProv.favoriteCities[i];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: ListTile(
                          tileColor: Colors.white.withOpacity(0.2),
                          title: Text(
                            city,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white70,
                          ),
                          onTap: () async {
                            await weatherProv.fetchWeather(context, city);
                            Navigator.pushNamed(context, "/details");
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
