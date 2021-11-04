import 'package:AI_delivery_app/pages/delivery_page.dart';
import 'package:AI_delivery_app/pages/home_page.dart';
import 'package:AI_delivery_app/pages/mine_page.dart';
import 'package:AI_delivery_app/pages/notify_page.dart';
import 'package:flutter/material.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  int selectedIndex = 0;
  List<Container> containerList = [
    Container(
      child: HomePage(),
    ),
    Container(
      child: DeliveryPage(),
    ),
    Container(
      child: NotifyPage(),
    ),
    Container(
      child: MinePage(),
    )
  ];

  List nav = [
    {
      'index': 0,
      'title': 'F1',
      'icon': Icons.home,
      'activeIcon': Icons.home,
    },
    {
      'index': 1,
      'title': 'F2',
      'icon': Icons.book,
      'activeIcon': Icons.book,
    },
    {
      'index': 2,
      'title': 'F3',
      'icon': Icons.school,
      'activeIcon': Icons.school,
    },
    {
      'index': 3,
      'title': 'F2',
      'icon': Icons.perm_camera_mic,
      'activeIcon': Icons.perm_camera_mic,
    }
  ];

  List<BottomNavigationBarItem> buildGrid() {
    List<BottomNavigationBarItem> tiles = [];
    for (var item in nav) {
      print(item);
      tiles.add(
          BottomNavigationBarItem(
            title: Text(item['title'], style: TextStyle(color: selectedIndex == item['index'] ? Colors.red : Colors.grey),),
            icon: Icon(item['icon'], color: Colors.grey),
            activeIcon: Icon(item['activeIcon'], color: Colors.red),
          )
      );
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: containerList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: buildGrid()
      ),
    );
  }
}
