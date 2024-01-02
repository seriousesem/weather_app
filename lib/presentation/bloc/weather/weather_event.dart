abstract class WeatherEvent {
  const WeatherEvent();
}

class FetchWeather extends WeatherEvent {
  const FetchWeather();
}
class FetchCurrentLocation extends WeatherEvent {
  const FetchCurrentLocation();
}
