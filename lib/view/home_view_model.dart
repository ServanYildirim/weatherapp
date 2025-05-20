import 'package:flutter/material.dart';
import 'package:weather_app/core/service/weather_service.dart';

class HomeViewModel with ChangeNotifier {
  WeatherService weatherService = WeatherService();
  TextEditingController searchCityController = TextEditingController();

  void onEditingComplete(BuildContext context) async {
    if (searchCityController.text.isNotEmpty) {
      weatherService.getCityCoordByName(cityName: searchCityController.text).then((result) async {
        if (result != null) {
          await weatherService.getCurrentTempature(latitude: result.lat!, longitude: result.lon!);
        }
      });
    }
    FocusScope.of(context).unfocus();
  }
}
