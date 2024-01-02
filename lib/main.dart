import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/di/injection_container.dart';
import 'core/navigation/app_routes.dart';
import 'core/theme/app_themes.dart';
import 'presentation/bloc/weather/weather_block.dart';
import 'presentation/bloc/weather/weather_event.dart';
import 'presentation/pages/current_weather/current_weather_page.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => getIt()..add(const FetchCurrentLocation()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: theme(),
        home: const CurrentWeatherPage(),
      ),
    );
  }
}
