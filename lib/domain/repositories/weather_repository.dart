


import '../../core/resources/data_state.dart';
import '../models/weather_model.dart';

abstract class WeatherRepository {
  Future<DataState<WeatherModel>> fetchWeather(String latitude, String longitude);
}