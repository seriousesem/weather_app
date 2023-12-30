import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/presentation/bloc/weather/remote/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather/remote/weather_state.dart';
import 'package:weather_app/utils/constants.dart';

import '../../../../domain/params/geolocation_params.dart';
import '../../../../domain/usecase/fetch_weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final FetchWeatherUseCase _fetchWeatherUseCase;

  WeatherBloc(this._fetchWeatherUseCase) : super(const WeatherStateLoading()) {
    on<FetchWeather>(onFetchWeather);
  }

  onFetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    const GeolocationParams params = GeolocationParams(
        latitude: ApiKeys.defaultLatitude, longitude: ApiKeys.defaultLongitude);
    final dataState = await _fetchWeatherUseCase.call(params: params);

    if (dataState is DataSuccess && dataState.data != null) {
      emit(WeatherStateSuccess(dataState.data!));
    }
    if (dataState is DataError) {
      emit(WeatherStateError(dataState.error!));
    }
  }
}
