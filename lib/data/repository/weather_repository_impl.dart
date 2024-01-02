import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/data/dto/weather_dto.dart';
import 'package:weather_app/data/retrofit/weather_api_service.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/utils/constants.dart';

import '../../core/resources/error_type.dart';
import '../../core/resources/response_handler.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService _weatherApiService;
  final ResponseHandler<WeatherDto> _responseHandler;

  WeatherRepositoryImpl(this._weatherApiService, this._responseHandler);

  @override
  Future<DataState<WeatherDto>> fetchWeather(
      String latitude, String longitude) async {
    try {
      return await _responseHandler.handleResponse(() async =>
          await _weatherApiService.fetchWeather(
              latitude: latitude,
              longitude: longitude,
              appId: ApiKeys.appId,
              units: ApiKeys.units,
              lang: ApiKeys.lang));
    } catch (e) {
      return DataError(
          '${AppErrors.unknownError} ${e.toString()}', ErrorType.unknownError);
    }
  }
}
