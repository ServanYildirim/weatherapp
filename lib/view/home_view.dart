// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_app/core/controller/main_controller.dart';
import 'package:weather_app/model/weather_response_model.dart';
import 'package:weather_app/view/home_view_model.dart';
import 'package:weather_app/view/search_view.dart';

class HomeView extends StatelessWidget with ChangeNotifier {
  HomeViewModel homeViewModel = HomeViewModel();

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: MainController.coordValue,
          builder: (context, coordValue, child) {
            if (coordValue == null && (coordValue?.lat == null || coordValue?.lon == null)) {
              return const CircularProgressIndicator.adaptive();
            } else {
              return FutureBuilder(
                future: homeViewModel.weatherService.getCurrentTempature(
                  latitude: coordValue!.lat!,
                  longitude: coordValue.lon!,
                ),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return buildScaffoldBody(snapshot.data, context);
                  } else {
                    return const CircularProgressIndicator.adaptive();
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildScaffoldBody(WeatherReponseModel? weatherData, BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: MainController.weatherReponseModel,
      builder: (context, weatherReponseModel, child) {
        if (weatherReponseModel == null) {
          return const CircularProgressIndicator.adaptive();
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Temperature: ${weatherReponseModel.main?.temp}", style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
              Text("Condition: ${weatherReponseModel.name}", style: const TextStyle(fontSize: 20)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchView()));
                },
                child: Text("Arama Sayfasına Git"),
              ),
            ],
          );
        }
      },
    );
  }
}
