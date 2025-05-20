import 'package:flutter/material.dart';
import 'package:weather_app/core/controller/location_controller.dart';
import 'package:weather_app/view/home_view.dart';

void main() {
  runApp(const MaterialApp(home: WeatherApp()));
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  LocationController locationController = LocationController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      locationController.checkService();
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
