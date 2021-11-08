/**
 * @ClassName 模板
 * @Author wushaohang
 * @Date 2021-11-3
 **/
import 'package:AI_delivery_app/components/donut_pie_chart.dart';
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
      backgroundColor: Color(0xffF6F6F8),
      body: ListView(
        children: <Widget>[
          Container(
            width: dp(710),
            height: dp(535),
            margin: EdgeInsets.only(left: dp(20), right: dp(20), top: dp(24)),
            child: Center(
              child: Container(
                width: dp(400),
                height: dp(400),
                child: DonutPieChart.withSampleData(),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(dp(20))
            ),
          ),
        ],
      ),
    );
  }
}