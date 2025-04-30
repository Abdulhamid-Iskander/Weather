class WeatherModel {
  final String city;
  final String country;
  final double tempC;
  final String condition;
  final String iconUrl;

  WeatherModel({
    required this.city,
    required this.country,
    required this.tempC,
    required this.condition,
    required this.iconUrl,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['location']['name'],
      country: json['location']['country'],
      tempC: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
      iconUrl: "https:${json['current']['condition']['icon']}",
    );
  }
}
