class Weather {
  Location location;
  CurrentWeather current;
  List<DayForecast> forecastday;

  Weather({
    required this.location,
    required this.current,
    required this.forecastday,
  });

  factory Weather.fromJson(dynamic json) {
    List forecastdays = json['forecast']['forecastday'];
    List<DayForecast> days = forecastdays.map((item)=> DayForecast.fromJson(item)).toList();

    return Weather(
      location: Location.fromJson(json['location']),
      current: CurrentWeather.fromJson(json['current']),
        forecastday: days,
      // forecast: Forecast.fromJson(json['forecast']['forecastday']),
    );
  }
}

class Location {
  final String name;
  final String region;
  final String country;
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      localtime: json['localtime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'region': region,
      'country': country,
      'localtime': localtime,
    };
  }
}

class Condition {
  final String text;
  final String icon;
  final int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'icon': icon,
      'code': code,
    };
  }
}

class CurrentWeather {
  final String lastUpdated;
  final double tempC;
  final Condition condition;

  CurrentWeather({
    required this.lastUpdated,
    required this.tempC,
    required this.condition,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      lastUpdated: json['last_updated'],
      tempC: json['temp_c'],
      condition: Condition.fromJson(json['condition']),
    );
  }

  // Method to convert a CurrentWeather object to JSON
  Map<String, dynamic> toJson() {
    return {
      'last_updated': lastUpdated,
      'temp_c': tempC,
      'condition': condition.toJson(),
    };
  }
}

class DayForecast {
  final String date;
  final Day day;
  final Astro astro;
  final List<HourlyForecast> hour;

  DayForecast({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory DayForecast.fromJson(Map<String, dynamic> json) {
    var list = json['hour'] as List;
    List<HourlyForecast> hourlyList =
    list.map((i) => HourlyForecast.fromJson(i)).toList();

    return DayForecast(
      date: json['date'],
      day: Day.fromJson(json['day']),
      astro: Astro.fromJson(json['astro']),
      hour: hourlyList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'day': day.toJson(),
      'astro': astro.toJson(),
      'hour': hour.map((e) => e.toJson()).toList(),
    };
  }
}

class HourlyForecast {
  final String time;
  final double tempC;
  final int isDay;
  final Condition condition;

  HourlyForecast({
    required this.time,
    required this.tempC,
    required this.isDay,
    required this.condition,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    return HourlyForecast(
      time: json['time'],
      tempC: json['temp_c'],
      isDay: json['is_day'],
      condition: Condition.fromJson(json['condition']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'temp_c': tempC,
      'is_day': isDay,
      'condition': condition.toJson(),
    };
  }
}


class Day {
  final double maxTempC;
  final double maxTempF;
  final double minTempC;
  final double minTempF;
  final double avgTempC;
  final double avgTempF;
  final double maxWindMph;
  final double maxWindKph;
  final double totalPrecipMm;
  final double totalPrecipIn;
  final double totalSnowCm;
  final double avgVisKm;
  final double avgVisMiles;
  final int avgHumidity;
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final int dailyWillItSnow;
  final int dailyChanceOfSnow;
  final Condition condition;
  final double uv;

  Day({
    required this.maxTempC,
    required this.maxTempF,
    required this.minTempC,
    required this.minTempF,
    required this.avgTempC,
    required this.avgTempF,
    required this.maxWindMph,
    required this.maxWindKph,
    required this.totalPrecipMm,
    required this.totalPrecipIn,
    required this.totalSnowCm,
    required this.avgVisKm,
    required this.avgVisMiles,
    required this.avgHumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxTempC: json['maxtemp_c'],
      maxTempF: json['maxtemp_f'],
      minTempC: json['mintemp_c'],
      minTempF: json['mintemp_f'],
      avgTempC: json['avgtemp_c'],
      avgTempF: json['avgtemp_f'],
      maxWindMph: json['maxwind_mph'],
      maxWindKph: json['maxwind_kph'],
      totalPrecipMm: json['totalprecip_mm'],
      totalPrecipIn: json['totalprecip_in'],
      totalSnowCm: json['totalsnow_cm'],
      avgVisKm: json['avgvis_km'],
      avgVisMiles: json['avgvis_miles'],
      avgHumidity: json['avghumidity'],
      dailyWillItRain: json['daily_will_it_rain'],
      dailyChanceOfRain: json['daily_chance_of_rain'],
      dailyWillItSnow: json['daily_will_it_snow'],
      dailyChanceOfSnow: json['daily_chance_of_snow'],
      condition: Condition.fromJson(json['condition']),
      uv: json['uv'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maxtemp_c': maxTempC,
      'maxtemp_f': maxTempF,
      'mintemp_c': minTempC,
      'mintemp_f': minTempF,
      'avgtemp_c': avgTempC,
      'avgtemp_f': avgTempF,
      'maxwind_mph': maxWindMph,
      'maxwind_kph': maxWindKph,
      'totalprecip_mm': totalPrecipMm,
      'totalprecip_in': totalPrecipIn,
      'totalsnow_cm': totalSnowCm,
      'avgvis_km': avgVisKm,
      'avgvis_miles': avgVisMiles,
      'avghumidity': avgHumidity,
      'daily_will_it_rain': dailyWillItRain,
      'daily_chance_of_rain': dailyChanceOfRain,
      'daily_will_it_snow': dailyWillItSnow,
      'daily_chance_of_snow': dailyChanceOfSnow,
      'condition': condition.toJson(),
      'uv': uv,
    };
  }
}

class Astro {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;
  final int moonIllumination;
  final int isMoonUp;
  final int isSunUp;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moonPhase: json['moon_phase'],
      moonIllumination: json['moon_illumination'],
      isMoonUp: json['is_moon_up'],
      isSunUp: json['is_sun_up'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moon_phase': moonPhase,
      'moon_illumination': moonIllumination,
      'is_moon_up': isMoonUp,
      'is_sun_up': isSunUp,
    };
  }
}
