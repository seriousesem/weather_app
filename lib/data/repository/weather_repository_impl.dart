import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/data/dto/weather_dto.dart';
import 'package:weather_app/data/retrofit/weather_api_service.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/utils/constants.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService _weatherApiService;

  WeatherRepositoryImpl(this._weatherApiService);

  @override
  Future<DataState<WeatherDto>> fetchWeather(
      String latitude, String longitude) async {
    try {
      final httpResponse = await _weatherApiService.fetchWeather(
          latitude: latitude,
          longitude: longitude,
          appId: ApiKeys.appId,
          units: ApiKeys.units,
          lang: ApiKeys.lang);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}