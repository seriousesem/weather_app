import 'package:flutter/material.dart';
import 'package:weather_app/domain/models/weather_model.dart';
import '../../../utils/constants.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/button_back_widget.dart';
import '../../widgets/details_weather_card_widget.dart';

class DetailsWeatherPage extends StatelessWidget {
  final WeatherModel weatherModel;

  const DetailsWeatherPage({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(Titles.detailsWeatherPageTitle,
          buildButtonBackWidget(() => Navigator.pop(context))),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildDetailsWeatherCardWidget(
          weatherModel,
        ),
      ],
    );
  }
}
