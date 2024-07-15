import 'package:finallproject/ConstansApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/Models.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class ItemList {
  String nameLocation;
  bool isLoaded;
  late Weather weather;

  ItemList(
    this.nameLocation,
    this.isLoaded,
  );
}

class _PlacesScreenState extends State<PlacesScreen> {
  List<ItemList> items = [
    ItemList("London", false),
    ItemList("Gaza", false),
    ItemList("Hebron", false),
    ItemList("London", false),
    ItemList("London", false),
  ];

  TextStyle textStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);

  Widget getItemUser(ItemList itemList) {
    ConstansApi.getCurrentWeather(itemList.nameLocation).then(
      (value) {
        setState(() {
          itemList.weather = value;
          itemList.isLoaded = true;
        });
      },
    );

    return Card(
      elevation: 20,
      child: Container(
        child: itemList.isLoaded
            ? isLoadedTrueItem(itemList)
            : isLoadedFalseItem(),
      ),
    );
  }

  Widget isLoadedTrueItem(ItemList itemList) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemList.weather.location.name,
                  style: textStyle,
                ),
                Text(
                  "${itemList.weather.current.tempC}C",
                  style: textStyle,
                )
              ],
            ),
          ),
        ),
        Image(
          image: NetworkImage(itemList.weather.current.condition.icon),
        )
      ],
    );
  }

  Widget isLoadedFalseItem() {
    return Container(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(
          color: CupertinoColors.activeBlue,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return getItemUser(items[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: items.length),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    TextEditingController itemController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Country'),
          content: TextField(
            controller: itemController,
            decoration: InputDecoration(hintText: "Enter item name"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (itemController.text.isNotEmpty) {
                  items.add(ItemList(itemController.text, false));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
