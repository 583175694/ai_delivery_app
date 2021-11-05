// 路由列表模块

import 'package:flutter/material.dart';

class Nav {
  int index;
  String title;
  IconData icon;
  IconData activeIcon;

  Nav(this.index, this.title, this.icon, this.activeIcon);
}