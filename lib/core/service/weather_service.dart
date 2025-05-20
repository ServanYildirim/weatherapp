import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/controller/main_controller.dart';
import 'package:weather_app/model/search_city_response_model.dart';
import 'package:weather_app/model/weather_response_model.dart';

class WeatherService with ChangeNotifier {
  final String apiKey = "47785aa1720de454a9011e5569117ae9";
  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  final String geoCodingApiBaseURL = "https://api.openweathermap.org/geo/1.0/direct?q";
  int? currentCondition;
  double? currentTempature;

  Future<WeatherReponseModel?> getCurrentTempature({required double latitude, required double longitude}) async {
    final url = "$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric";

    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == HttpStatus.ok) {
        MainController.weatherReponseModel.value = WeatherReponseModel.fromJson(json.decode(res.body));
        notifyListeners();
        log("WeatherResponseModel: ${MainController.weatherReponseModel.value?.toJson().toString()}");
        return MainController.weatherReponseModel.value;
      } else {
        print("API'den veri gelmiyor");
        return null;
      }
    } catch (e) {
      print("getCurrentTempature URL oluşturma hatası:  $e");
      return null;
    }
  }

  Future<SearchCityResponseModel?> getCityCoordByName({required String cityName}) async {
    final url = "$geoCodingApiBaseURL=$cityName&appid=$apiKey";

    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == HttpStatus.ok) {
        SearchCityResponseModel searchCityResponseModel = SearchCityResponseModel.fromJson(json.decode(res.body)[0]);
        log("SearchCityResponseModel: ${searchCityResponseModel.toJson().toString()}");
        return searchCityResponseModel;
      } else {
        print("API'den veri gelmiyor");
        return null;
      }
    } catch (e) {
      print("getCityCoordByName URL oluşturma hatası: $e");
      return null;
    }
  }

  //gelen veriyi dinamik hale getirdiğimiz fonksiyon
  // HomeViewModel? getWeatherDisplayData() {
  //   if (currentCondition == null) return null;
  //   if (currentCondition! < 600) {
  //     return HomeViewModel(
  //       weatherIcon: Icon(Icons.cloud, size: 75, color: Colors.white),
  //       weatherImage: AssetImage("assets/images/bulutlu.jpg"),
  //     );
  //   } else {
  //     var now = DateTime.now();
  //     if (now.hour >= 19) {
  //       return HomeViewModel(
  //         weatherIcon: Icon(Icons.nights_stay, size: 75, color: Colors.white),
  //         weatherImage: AssetImage("assets/images/gece.jpg"),
  //       );
  //     } else {
  //       return HomeViewModel(
  //         weatherIcon: Icon(Icons.wb_sunny, size: 75, color: Colors.white),
  //         weatherImage: AssetImage("assets/images/gunesli.jpg"),
  //       );
  //     }
  //   }
  // }
}
