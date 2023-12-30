import 'package:weather_app/domain/models/weather_model.dart';

class WeatherDto extends WeatherModel {
  const WeatherDto({
    required super.cityName,
    required super.main,
    required super.description,
    required super.iconCode,
    required super.temperature,
    required super.pressure,
    required super.humidity,
    required super.visibility,
    required super.windSpeed,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) => WeatherDto(
        cityName: json['name'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        iconCode: json['weather'][0]['icon'],
        temperature: json['main']['temp'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
        visibility: json['visibility'],
        windSpeed: json['wind']['speed'],
      );
}
