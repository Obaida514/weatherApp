import 'package:flutter/material.dart';

import 'DailyForcestScreen.dart';
import 'HomeScreen.dart';
import 'HourlyForcestScreen.dart';
import 'PlacesScreen.dart';

//a6c6ef2d743240a1b8903428241007
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeAppScreen(),
    );
  }
}

class HomeAppScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeAppScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    HourlyForcestScreen(),
    DailyForcestScreen(),
    PlacesScreen(),
  ];

  String tittleAppBar = "Weather App";

  void _onItemTapped(int index) {
    setState(() {
      switch (index){
        case 0: tittleAppBar = "HomeScreen";break;
        case 1: tittleAppBar = "Hourly Forcest";break;
        case 2: tittleAppBar = "Daily Forcest";break;
        case 3: tittleAppBar = "City Weather";break;
      }
      _selectedIndex = index;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tittleAppBar),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Weather App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('HomeScreen'),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: Icon(Icons.hourglass_top_rounded),
              title: Text('Hourly Forcest'),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: Icon(Icons.settings_system_daydream_rounded),
              title: Text('Daily Forcest'),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: Icon(Icons.place_outlined),
              title: Text('Places'),
              onTap: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
