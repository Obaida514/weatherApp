import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ConstansApi.dart';
import 'models/Models.dart';

class HourlyForcestScreen extends StatefulWidget {
  const HourlyForcestScreen({super.key});

  @override
  State<HourlyForcestScreen> createState() => _HourlyForcestScreenState();
}

class _HourlyForcestScreenState extends State<HourlyForcestScreen> {
  TextStyle textStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);

  late Future<Weather>? futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = ConstansApi.getCurrentWeather("London");
  }

  Widget isLoadedFalseWidget() {
    return Center(
      child: Text(
        "Errror Data",
        style: textStyle,
      ),
    );
  }

  Widget isLoadingDataWidget() {
    return Center(
      child: CircularProgressIndicator(
        color: CupertinoColors.activeBlue,
      ),
    );
  }

  Widget isLoadedTrueWidghet(Weather weather) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return getItemUser(weather.forecastday[0].hour[index]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
          itemCount: weather.forecastday[0].hour.length),
    );
  }

  Widget getItemUser(HourlyForecast hour) {
    return Card(
      elevation: 20,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hour.time.substring(11, hour.time.length),
                style: textStyle,
              ),
              Image(
                image: NetworkImage(hour.condition.icon),
              ),
              Text(
                "${hour.tempC}C",
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: futureWeather,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Weather? weather = snapshot.data;
              return isLoadedTrueWidghet(weather!);
            } else if (snapshot.hasError) {
              return isLoadedFalseWidget();
            } else
              return isLoadingDataWidget();
          }),
    );
  }
}
