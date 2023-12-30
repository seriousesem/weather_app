import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widgets/weather_icon_widget.dart';
import '../../domain/models/weather_model.dart';
import '../../utils/constants.dart';
import 'card_item_widget.dart';
import 'city_name_widget.dart';

buildCurrentWeatherCardWidget(WeatherModel? weatherModel, Function() action) {
  return Container(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
    child: Card(
      color: Colors.blue.shade200,
      child: InkWell(
        onTap: action,
        child: Column(
          children: [
            buildCityNameWidget(weatherModel?.cityName ?? ""),
            buildWeatherIconWidget(weatherModel?.iconCode ?? ""),
            buildCardItemWidget(
              AppStrings.weatherDescription,
              weatherModel?.description ?? "",
              null,
            ),
            buildCardItemWidget(
              AppStrings.temperature,
              weatherModel?.temperature ?? "",
              AppStrings.celsius,
            ),
            _buildHintWidget(),
          ],
        ),
      ),
    ),
  );
}

_buildHintWidget() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    child: Row(
      children: [
        Expanded(
          child: Text(
            AppStrings.cardHint,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 10,
            ),
          ),
        ),
      ],
    ),
  );
}
