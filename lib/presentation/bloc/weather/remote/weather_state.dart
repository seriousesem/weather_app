import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/models/weather_model.dart';

abstract class WeatherState extends Equatable {
  final WeatherModel? weatherModel;
  final String? error;

  const WeatherState({this.weatherModel, this.error});

  @override
  List<Object> get props => [weatherModel!, error!];
}

class WeatherStateLoading extends WeatherState {
  const WeatherStateLoading();
}

class WeatherStateSuccess extends WeatherState {
  const WeatherStateSuccess(WeatherModel weatherModel)
      : super(weatherModel: weatherModel);
}

class WeatherStateError extends WeatherState {
  const WeatherStateError(String error) : super(error: error);
}
