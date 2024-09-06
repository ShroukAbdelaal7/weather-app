class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double min;
  final double max;
  final String condition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.temp,
      required this.min,
      required this.max,
      required this.condition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      min: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      max: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
