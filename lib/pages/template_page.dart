/**
 * @ClassName 模板
 * @Author wushaohang
 * @Date 2021-11-3
 **/
import 'package:flutter/material.dart';

class TemplatePage extends StatefulWidget {
  @override
  TemplatePageState createState() => TemplatePageState();
}

class TemplatePageState extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('模板'),
        elevation: 0,
      ),
      body: ListView(),
    );
  }
}