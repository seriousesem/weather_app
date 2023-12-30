import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/data/dto/weather_dto.dart';
import 'package:weather_app/utils/constants.dart';

part 'weather_api_service.g.dart';

@RestApi(baseUrl: ApiKeys.baseUrl)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio) = _WeatherApiService;

  @GET('/weather')
  Future<HttpResponse<WeatherDto>> fetchWeather({
    @Query('lat') String? latitude,
    @Query('lon') String? longitude,
    @Query('appid') String? appId,
    @Query('units') String? units,
    @Query('lang') String? lang,
  });
}
