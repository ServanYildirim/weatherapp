import 'package:flutter/widgets.dart';
import 'package:weather_app/model/coord_model.dart';
import 'package:weather_app/model/weather_response_model.dart';

class MainController {
  static final ValueNotifier<Coord?> coordValue = ValueNotifier(null);
  static final ValueNotifier<WeatherReponseModel?> weatherReponseModel = ValueNotifier(null);
}
