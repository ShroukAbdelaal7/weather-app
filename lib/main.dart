import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherStates>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                    useMaterial3: false,
                    primarySwatch: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.condition)),
                home: HomeView(),
              );
            },
          );
        }));
  }
}

MaterialColor getThemeColor(String? condition) {
  condition = condition?.toLowerCase();
  if (condition == null) {
    return Colors.blueGrey;
  }
  switch (condition) {
    case "sunny":
      return Colors.yellow;
    case "clear":
      return Colors.cyan;
    case "partly cloudy":
    case "cloudy":
    case "overcast":
      return Colors.grey;
    case "mist":
    case "fog":
    case "freezing fog":
      return Colors.grey;
    case "patchy rain possible":
    case "patchy snow possible":
    case "patchy sleet possible":
    case "patchy freezing drizzle possible":
    case "patchy light drizzle":
    case "light drizzle":
    case "light rain":
    case "light freezing rain":
    case "light sleet":
    case "light snow":
    case "light rain shower":
    case "light sleet showers":
    case "light snow showers":
    case "light showers of ice pellets":
    case "patchy light rain with thunder":
    case "patchy light snow with thunder":
      return Colors.lightBlue;
    case "moderate rain at times":
    case "moderate rain":
    case "heavy rain at times":
    case "heavy rain":
    case "moderate or heavy freezing rain":
    case "moderate or heavy sleet":
    case "moderate snow":
    case "moderate or heavy rain shower":
    case "moderate or heavy sleet showers":
    case "moderate or heavy snow showers":
    case "moderate or heavy showers of ice pellets":
    case "moderate or heavy rain with thunder":
    case "moderate or heavy snow with thunder":
      return Colors.blue;
    case "thundery outbreaks possible":
    case "blizzard":
    case "torrential rain shower":
      return Colors.grey;
    case "blowing snow":
    case "heavy freezing drizzle":
    case "heavy snow":
      return Colors.blueGrey;
    case "ice pellets":
      return Colors.grey;
    default:
      return Colors.blue;
  }
}
