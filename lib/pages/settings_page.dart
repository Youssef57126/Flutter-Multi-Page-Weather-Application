import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/settings_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProv = context.watch<SettingsProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.2),
        elevation: 0,
        title: const Text("Settings"),
        centerTitle: true,
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

        child: Column(
          children: [
            _buildGlassOption(
              child: RadioListTile(
                activeColor: Colors.white,
                title: const Text(
                  "Metric (°C)",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                value: "metric",
                groupValue: settingsProv.unit,
                onChanged: (value) {
                  settingsProv.changeUnit(value!);
                },
              ),
            ),
            const SizedBox(height: 20),

            _buildGlassOption(
              child: RadioListTile(
                activeColor: Colors.white,
                title: const Text(
                  "Imperial (°F)",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                value: "imperial",
                groupValue: settingsProv.unit,
                onChanged: (value) {
                  settingsProv.changeUnit(value!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlassOption({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: child,
        ),
      ),
    );
  }
}
