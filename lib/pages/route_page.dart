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

  List<Nav> nav = [
    new Nav(0, '首页', 'lib/assets/icons/icon_home_unchecked.png', 'lib/assets/icons/icon_home_selected.png'),
    new Nav(1, '精准投', 'lib/assets/icons/icon_precision_casting_unchecked.png', 'lib/assets/icons/icon_precision_investment_selected.png'),
    new Nav(2, '通知', 'lib/assets/icons/icon_notification_unchecked.png', 'lib/assets/icons/icon_notification_selected.png'),
    new Nav(3, '我的', 'lib/assets/icons/icon_my_unchecked.png', 'lib/assets/icons/icon_my_selected.png')
  ];

  List<BottomNavigationBarItem> routeList() {
    List<BottomNavigationBarItem> tiles = [];
    for (Nav item in nav) {
      tiles.add(
          BottomNavigationBarItem(
            title: Text(item.title, style: TextStyle(color: selectedIndex == item.index ? Colors.red : Colors.grey),),
            icon: Container(
              child: Image.asset(item.icon, width: ScreenUtil().setWidth(50), height: ScreenUtil().setWidth(50)),
            ),
            activeIcon: Container(
              child: Image.asset(item.activeIcon, width: ScreenUtil().setWidth(50), height: ScreenUtil().setWidth(50)),
            ),
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
