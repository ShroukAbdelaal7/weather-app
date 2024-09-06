import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(city: cityName);
      emit(WeatherLoadedSuc(weatherModel!));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
