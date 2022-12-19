import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pass_do/Screens/Home/user/components/subcomponent/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=1aa20e0fbcd5ca91dcec7e39aa2796f2&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}
