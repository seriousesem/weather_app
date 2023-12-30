import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/images_assets.dart';

buildWeatherIconWidget(String iconCode) {
  return Padding(
    padding: const EdgeInsets.only(top: 16),
    child: Image(
      image: AssetImage(weatherIcons[iconCode] ?? ImagesAssets.icon50n),
    ),
  );
}
