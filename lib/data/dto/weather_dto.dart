import 'package:weather_app/domain/models/weather_model.dart';

class WeatherDto extends WeatherModel {
  const WeatherDto({
    required super.cityName,
    required super.description,
    required super.iconCode,
    required super.temperature,
    required super.pressure,
    required super.humidity,
    required super.visibility,
    required super.windSpeed,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) => WeatherDto(
        cityName: json['name'].toString(),
        description: json['weather'][0]['description'].toString(),
        iconCode: json['weather'][0]['icon'] ?? "",
        temperature: json['main']['temp'].toString(),
        pressure: json['main']['pressure'].toString(),
        humidity: json['main']['humidity'].toString(),
        visibility: json['visibility'].toString(),
        windSpeed: json['wind']['speed'].toString(),
      );
}
