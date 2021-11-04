import 'package:AI_delivery_app/pages/route_page.dart';
import 'package:AI_delivery_app/plugins/screen_fit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'AI精准投',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: RoutePage(),
    );
  }
}
