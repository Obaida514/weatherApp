import 'package:finallproject/ConstansApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/Models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle textStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);

  late Future<Weather>? futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = ConstansApi.getCurrentWeather("London");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
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
      ),
    );
  }

  Widget isLoadedTrueWidghet(Weather weather) {
    print("******" + weather.current.condition.icon);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            weather.location.name,
            style: textStyle,
          ),
          Image.network(weather.current.condition.icon),
          Text(
            weather.current.tempC.toString(),
            style: textStyle,
          ),
          Text(
            weather.current.condition.text,
            style: textStyle,
          ),
        ],
      ),
    );
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
}
