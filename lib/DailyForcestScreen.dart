import 'package:finallproject/ConstansApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/Models.dart';

class DailyForcestScreen extends StatefulWidget {
  const DailyForcestScreen({super.key});

  @override
  State<DailyForcestScreen> createState() => _DailyForcestScreenState();
}

class _DailyForcestScreenState extends State<DailyForcestScreen> {
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
            return getItemUser(weather.forecastday[index]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
          itemCount: weather.forecastday.length),
    );
  }

  Widget getItemUser(DayForecast dayForecast) {
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
                dayForecast.date,
                style: textStyle,
              ),
              Image(
                image: NetworkImage(dayForecast.day.condition.icon),
              ),
              Text(
                "${dayForecast.day.maxTempC}C",
                style: textStyle,
              ),
              Text(
                "${dayForecast.day.minTempC}C",
                style: textStyle,
              )
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
