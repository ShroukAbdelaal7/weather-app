import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String apiKey = 'c80222d439184f088cd224300241205';
  final String baseUrl = 'http://api.weatherapi.com/v1';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errosMsg =
          e.response?.data['error']['message'] ?? 'oops error';
      throw Exception(errosMsg);
    } catch (e) {
      log(e.toString());
      throw Exception('oops error');
    }
  }
}
//   Future<WeatherModel> getForecastWeather({required String city}) async {
//     Response response = await dio.get(
//         '$baseUrl/forecast.json?key=A$apiKey&q=$city&days=1');
//     WeatherModel weatherModel = WeatherModel.fromJson(response.data);
//     return weatherModel;
//   }
// }
