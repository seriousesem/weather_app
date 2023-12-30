import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/models/weather_model.dart';
import 'package:weather_app/presentation/bloc/weather/remote/weather_block.dart';
import 'package:weather_app/presentation/bloc/weather/remote/weather_state.dart';
import 'package:weather_app/utils/constants.dart';
import '../../../core/navigation/app_routes.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/current_weather_card_widget.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        Titles.currentWeatherPageTitle,
        null,
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
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
              buildCurrentWeatherCardWidget(
                state.weatherModel!,
                () => _goToDetailsWeatherPage(
                  context,
                  state.weatherModel!,
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  _goToDetailsWeatherPage(BuildContext context, WeatherModel weatherModel) {
    Navigator.pushNamed(context, AppRoutesNames.detailsWeatherPage,
        arguments: weatherModel);
  }
}
