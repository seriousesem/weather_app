import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/config/theme/app_themes.dart';
import 'package:weather_app/di/injection_container.dart';
import 'package:weather_app/presentation/bloc/weather/remote/weather_block.dart';
import 'package:weather_app/presentation/pages/home/current_weather.dart';

import 'presentation/bloc/weather/remote/weather_event.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => getIt()..add(const FetchWeather()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const CurrentWeather(),
      ),
    );
  }
}
