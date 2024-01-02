import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/domain/models/weather_model.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

import '../models/geolocation_model.dart';

class FetchWeatherUseCase
    implements UseCase<DataState<WeatherModel>, GeolocationModel> {
  final WeatherRepository _weatherRepository;

  FetchWeatherUseCase(this._weatherRepository);

  @override
  Future<DataState<WeatherModel>> call({GeolocationModel? params}) {
    return _weatherRepository.fetchWeather(params!.latitude, params.longitude);
  }
}
