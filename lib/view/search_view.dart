import 'package:flutter/material.dart';
import 'package:weather_app/core/service/weather_service.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  TextEditingController searchCityController = TextEditingController();
  WeatherService weatherService = WeatherService();

  void onEditingComplete(BuildContext context) async {
    if (searchCityController.text.isNotEmpty) {
      weatherService.getCityCoordByName(cityName: searchCityController.text).then((result) async {
        if (result != null) {
          await weatherService.getCurrentTempature(latitude: result.lat!, longitude: result.lon!);
        }
      });
    }
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Search View", style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchCityController,
              onEditingComplete: () => onEditingComplete(context),
              decoration: const InputDecoration(
                labelText: "Şehir Ara",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
