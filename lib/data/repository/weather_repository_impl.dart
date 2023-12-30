import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/data/dto/weather_dto.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {

  @override
  Future<DataState<WeatherDto>> fetchWeather(
      String latitude, String longitude) {
    // TODO: implement fetchWeather
    throw UnimplementedError();
  }
}
