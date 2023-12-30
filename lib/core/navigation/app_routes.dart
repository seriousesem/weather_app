import 'package:flutter/material.dart';
import 'package:weather_app/presentation/pages/current_weather/current_weather_page.dart';

import '../../domain/models/weather_model.dart';
import '../../presentation/pages/details_weather/details_weather_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.currentWeatherPage:
        return _materialRoute(const CurrentWeatherPage());

      case AppRoutesNames.detailsWeatherPage:
        return _materialRoute(DetailsWeatherPage(
            weatherModel: settings.arguments as WeatherModel));

      default:
        return _materialRoute(const CurrentWeatherPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

abstract class AppRoutesNames {
  static const String currentWeatherPage = '/current_weather';
  static const String detailsWeatherPage = '/details_weather';
}
