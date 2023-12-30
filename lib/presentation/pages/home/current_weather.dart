import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/bloc/weather/remote/weather_block.dart';
import 'package:weather_app/presentation/bloc/weather/remote/weather_state.dart';

import '../../../utils/constants.dart';
import '../../../utils/images_assets.dart';
import '../../widgets/weather_card_widget.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        Titles.currentWeatherPageTitle,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (_, state) {
        if (state is WeatherStateLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is WeatherStateError) {
          return Center(
            child: Text(state.error!),
          );
        }
        if (state is WeatherStateSuccess) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeatherCard(
                weatherModel: state.weatherModel!,
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
