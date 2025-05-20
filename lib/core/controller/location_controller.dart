// ignore: unused_import
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:location/location.dart';
import 'package:weather_app/core/controller/main_controller.dart';
import 'package:weather_app/model/coord_model.dart';

class LocationController with ChangeNotifier {
  MainController mainController = MainController();

  Future<void> checkService() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    _locationData = await location.getLocation();

    if (_locationData.latitude != null && _locationData.longitude != null) {
      MainController.coordValue.value = Coord(lat: _locationData.latitude, lon: _locationData.longitude);
    }
    log(MainController.coordValue.value?.toJson().toString() ?? "null");
  }
}
