import 'package:AI_delivery_app/model/route_model.dart';
import 'package:AI_delivery_app/pages/delivery_page.dart';
import 'package:AI_delivery_app/pages/home_page.dart';
import 'package:AI_delivery_app/pages/mine_page.dart';
import 'package:AI_delivery_app/pages/notify_page.dart';
import 'package:AI_delivery_app/plugins/screen_fit.dart';
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
    new Nav(0, 'F1', Icons.home, Icons.home),
    new Nav(1, 'F2', Icons.book, Icons.book),
    new Nav(2, 'F3', Icons.school, Icons.school),
    new Nav(3, 'F4', Icons.perm_camera_mic, Icons.perm_camera_mic)
  ];

  List<BottomNavigationBarItem> routeList() {
    List<BottomNavigationBarItem> tiles = [];
    for (Nav item in nav) {
      tiles.add(
          BottomNavigationBarItem(
            title: Text(item.title, style: TextStyle(color: selectedIndex == item.index ? Colors.red : Colors.grey),),
            icon: Icon(item.icon, color: Colors.grey),
            activeIcon: Icon(item.activeIcon, color: Colors.red),
          )
      );
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1624)
      ..init(context);

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
        items: routeList()
      ),
    );
  }
}
