
import 'images_assets.dart';

abstract class ApiKeys{
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String appId = '65577fdecf5d711a0facde5aec405449';
  static const String units = 'metric';
  static const String lang = 'uk';
  static const String defaultLatitude = '50.45';
  static const String defaultLongitude = '30.52';
}

abstract class Titles{
  static const String currentWeatherPageTitle = 'Поточна погода';
  static const String detailsWeatherPageTitle = 'Детальна інформація';
  static const String errorDialogTitle = 'Сталася помилка';
  static const String yesButtonTitle = 'Так';
  static const String noButtonTitle = 'Ні';
}
abstract class AppStrings{
  static const String weatherDescription = 'Погодні умови: ';
  static const String temperature = 'Температура: ';
  static const String pressure = 'Атмосферний тиск: ';
  static const String humidity = 'Вологість: ';
  static const String visibility = 'Видимість: ';
  static const String windSpeed = 'Швидкість вітру: ';
  static const String celsius = '°C';
  static const String gigaPaskal = 'гПа';
  static const String percent = '%';
  static const String meterPerSecond = 'м/с';
  static const String cardHint = 'Для детальної інформації про погоду натисніть на картку';
}
abstract class AppErrors{
  static const String locationPermissionError = 'Для отримання данних про погоду для вашого міста потрібно надати доступ до геолокації, "Так" - відкрити екран налаштування додатку, "Ні" - заватажити данні для Пуща-Водиця';
  static const String unknownError = 'Виникла невідома помилка, повідомте про цю помилку службу підтримки';
  static const String noInternetConnectionError = 'Відсутнє підключення до інтернету, увімкніть інтернет та спробуйте ще раз';
  static const String connectionTimeoutError = 'Викликано тайм-аут підключення, спробуйте трішки пізніше';
  static const String invalidDataFormatError = 'Недійсний формат данних, повідомте про цю помилку службу підтримки';

}
abstract class WeatherIconCodes{
  static const String iconCode01d = '01d';
  static const String iconCode01n = '01n';
  static const String iconCode02d = '02d';
  static const String iconCode02n = '02n';
  static const String iconCode03d = '03d';
  static const String iconCode03n = '03n';
  static const String iconCode04d = '04d';
  static const String iconCode04n = '04n';
  static const String iconCode09d = '09d';
  static const String iconCode09n = '09n';
  static const String iconCode10d = '10d';
  static const String iconCode10n = '10n';
  static const String iconCode11d = '11d';
  static const String iconCode11n = '11n';
  static const String iconCode13d = '13d';
  static const String iconCode13n = '13n';
  static const String iconCode50d = '50d';
  static const String iconCode50n = '50n';
}

const Map<String, String> weatherIcons = {
  WeatherIconCodes.iconCode01d: ImagesAssets.icon01d,
  WeatherIconCodes.iconCode01n: ImagesAssets.icon01n,
  WeatherIconCodes.iconCode02d: ImagesAssets.icon02d,
  WeatherIconCodes.iconCode02n: ImagesAssets.icon02n,
  WeatherIconCodes.iconCode03d: ImagesAssets.icon03d,
  WeatherIconCodes.iconCode03n: ImagesAssets.icon03n,
  WeatherIconCodes.iconCode04d: ImagesAssets.icon04d,
  WeatherIconCodes.iconCode04n: ImagesAssets.icon04n,
  WeatherIconCodes.iconCode09d: ImagesAssets.icon09d,
  WeatherIconCodes.iconCode09n: ImagesAssets.icon09n,
  WeatherIconCodes.iconCode10d: ImagesAssets.icon10d,
  WeatherIconCodes.iconCode10n: ImagesAssets.icon10n,
  WeatherIconCodes.iconCode11d: ImagesAssets.icon11d,
  WeatherIconCodes.iconCode11n: ImagesAssets.icon11n,
  WeatherIconCodes.iconCode13d: ImagesAssets.icon13d,
  WeatherIconCodes.iconCode13n: ImagesAssets.icon13n,
  WeatherIconCodes.iconCode50d: ImagesAssets.icon50d,
  WeatherIconCodes.iconCode50n: ImagesAssets.icon50n,
};