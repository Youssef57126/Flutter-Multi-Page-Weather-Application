class WeatherModel {
  final String city;
  final double temp;
  final String description;
  final double feelsLike;
  final int humidity;
  final double wind;
  final int sunrise;
  final int sunset;
  final String icon;
  final int timezone;

  WeatherModel.fromJson(Map<String, dynamic> json)
    : city = json["name"],
      temp = (json["main"]["temp"]).toDouble(),
      description = json["weather"][0]["description"],
      feelsLike = (json["main"]["feels_like"]).toDouble(),
      humidity = json["main"]["humidity"],
      wind = (json["wind"]["speed"]).toDouble(),
      sunrise = json["sys"]["sunrise"],
      sunset = json["sys"]["sunset"],
      timezone = json["timezone"],
      icon = json["weather"][0]["icon"];
}
