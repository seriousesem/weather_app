import 'package:flutter/material.dart';

buildCityNameWidget(String cityName) {
  return Padding(
    padding: const EdgeInsets.only(top: 32),
    child: Text(
      cityName,
      style: const TextStyle(
          color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}
