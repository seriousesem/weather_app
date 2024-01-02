import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/resources/dio_exception_handler.dart';
import 'package:weather_app/data/dto/weather_dto.dart';
import 'package:weather_app/data/repository/weather_repository_impl.dart';
import 'package:weather_app/data/retrofit/weather_api_service.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/usecase/fetch_weather.dart';

import '../core/resources/response_handler.dart';
import '../presentation/bloc/weather/weather_block.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  getIt.registerSingleton<Dio>(Dio());
  // ApiService
  getIt.registerSingleton<WeatherApiService>(WeatherApiService(getIt()));
  // DioExceptionHandler
  getIt.registerFactory<DioExceptionHandler<WeatherDto>>(
      () => DioExceptionHandler<WeatherDto>());
  // ResponseHandler
  getIt.registerFactory<ResponseHandler<WeatherDto>>(
      () => ResponseHandler<WeatherDto>(getIt()));
  // WeatherRepository
  getIt.registerSingleton<WeatherRepository>(
      WeatherRepositoryImpl(getIt(), getIt()));
  // UseCases
  getIt.registerSingleton<FetchWeatherUseCase>(FetchWeatherUseCase(getIt()));
  // Blocs
  getIt.registerFactory<WeatherBloc>(
    () => WeatherBloc(getIt()),
  );
}
