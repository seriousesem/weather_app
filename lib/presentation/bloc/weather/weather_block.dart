import 'package:app_settings/app_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather_app/core/resources/error_type.dart';
import 'package:weather_app/presentation/bloc/weather/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather/weather_state.dart';
import 'package:weather_app/utils/constants.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/models/geolocation_model.dart';
import '../../../domain/usecase/fetch_weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final FetchWeatherUseCase _fetchWeatherUseCase;

  var currentLocation = const GeolocationModel(
      latitude: ApiKeys.defaultLatitude, longitude: ApiKeys.defaultLongitude);

  WeatherBloc(this._fetchWeatherUseCase) : super(const WeatherStateLoading()) {
    on<FetchCurrentLocation>(onFetchCurrentLocation);
    on<FetchWeather>(onFetchWeather);
  }

  onFetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    emit(const WeatherStateLoading());
    final dataState = await _fetchWeatherUseCase.call(params: currentLocation);

    if (dataState is DataSuccess && dataState.data != null) {
      emit(WeatherStateSuccess(dataState.data!));
    }
    if (dataState is DataError) {
      emit(WeatherStateError(dataState.error ?? AppErrors.unknownError,
          dataState.errorType ?? ErrorType.unknownError));
    }
  }

  onFetchCurrentLocation(
      FetchCurrentLocation event, Emitter<WeatherState> emit) async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    permissionGranted = await location.requestPermission();
    if (permissionGranted == PermissionStatus.denied ||
        permissionGranted == PermissionStatus.deniedForever) {
      emit(const WeatherStateError(
          AppErrors.locationPermissionError, ErrorType.permissionError));
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await location.getLocation();
    currentLocation = GeolocationModel(
      latitude: locationData.latitude.toString(),
      longitude: locationData.longitude.toString(),
    );
    add(const FetchWeather());
  }

  onNoButtonAction() {
    add(const FetchWeather());
  }

  onYesButtonAction(ErrorType errorType) {
    if (errorType == ErrorType.permissionError) {
      AppSettings.openAppSettings();
      add(const FetchCurrentLocation());
    } else {
      add(const FetchWeather());
    }
  }
}
