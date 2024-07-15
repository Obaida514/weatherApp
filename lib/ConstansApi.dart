import 'dart:convert';

import 'package:finallproject/models/Models.dart';
import 'package:http/http.dart' as http;

class ConstansApi {
  static String apiRequest1 =
      "http://api.weatherapi.com/v1/forecast.json?key=a6c6ef2d743240a1b8903428241007&q=";
  static String apiRequest2 = "&days=7&aqi=no&alerts=no";

  static Future<Weather> getCurrentWeather(String location) async {
    http.Response response = await fetchData(location);
    var jsonObject = json.decode(response.body);
    Weather weather = Weather.fromJson(jsonObject);
    return weather;
  }

  static Future<http.Response> fetchData(String location) {
    return http.get(Uri.parse("$apiRequest1$location$apiRequest2"));
  }
}
