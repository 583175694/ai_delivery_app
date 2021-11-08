/**
 * @ClassName 模板
 * @Author wushaohang
 * @Date 2021-11-3
 **/
import 'package:AI_delivery_app/entity/dog.dart';
import 'package:AI_delivery_app/plugins/base.dart';
import 'package:AI_delivery_app/plugins/http.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with Base {
  Dog? dogRes;
  @override
  void initState() {
    super.initState();

    requestDog();
  }

  void requestDog() async {
    print(dogRes);
    var response = await HttpUtils.request(
        '/breeds/image/random',
        method: HttpUtils.GET
    );
    setState(() {
      dogRes = Dog.fromJson(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页', style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1))),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          dogRes == null ? Container() : Image.network(dogRes!.message),
        ],
      ),
    );
  }
}