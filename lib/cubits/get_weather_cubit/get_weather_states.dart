import 'package:weather_app/models/weather_model.dart';

class NoWeatherState extends WeatherStates {}

class WeatherLoadedSuc extends WeatherStates {
  final WeatherModel weatherModel;

  WeatherLoadedSuc(this.weatherModel);
}

class WeatherFailure extends WeatherStates {
  final String errMSg;

  WeatherFailure(this.errMSg);
}

class WeatherStates {}
