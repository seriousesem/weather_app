import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/models/weather_model.dart';

import '../../../core/resources/error_type.dart';

abstract class WeatherState extends Equatable {
  final WeatherModel? weatherModel;
  final String? error;
  final ErrorType? errorType;

  const WeatherState({
    this.weatherModel,
    this.error,
    this.errorType,
  });

  @override
  List<Object> get props => [weatherModel!, error!, errorType!];
}

class WeatherStateLoading extends WeatherState {
  const WeatherStateLoading();
}

class WeatherStateSuccess extends WeatherState {
  const WeatherStateSuccess(WeatherModel weatherModel)
      : super(weatherModel: weatherModel);
}

class WeatherStateError extends WeatherState {
  const WeatherStateError(String error, ErrorType errorType)
      : super(error: error, errorType: errorType);
}
