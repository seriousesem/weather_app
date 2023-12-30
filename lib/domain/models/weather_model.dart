import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  const WeatherModel({
    required this.cityName,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
  });

  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final String temperature;
  final String pressure;
  final String humidity;
  final String visibility;
  final String windSpeed;

  @override
  List<Object> get props => [
        cityName,
        main,
        description,
        iconCode,
        temperature,
        pressure,
        humidity,
        visibility,
        windSpeed,
      ];
}
