library base;
/*
 * @discripe: 全局公共类管理
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:AI_delivery_app/plugins/screen_fit.dart';


// 所有Widget继承的抽象类
abstract class Base {
  // 初始化设计稿尺寸
  static final double designWidth = 750;
  static final double designHeight = 1624;

  // flutter_ScreenUtil px转dp
  double dp(double designValue) => ScreenUtil.getInstance().setWidth(designValue);
}