/**
 * @ClassName 模板
 * @Author wushaohang
 * @Date 2021-11-3
 **/
import 'package:AI_delivery_app/plugins/screen_fit.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  MinePageState createState() => MinePageState();
}

class MinePageState extends State<MinePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的', style: TextStyle(color: Colors.white),),
        elevation: 0,
        backgroundColor: Color(0xffCF1000),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(260),
              color: Color(0xffCF1000),
              child: Row(
                children: [
                  Container(
                    width: ScreenUtil().setWidth(102),
                    height: ScreenUtil().setWidth(102),
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(51),
                      border: Border.all(color: Colors.white, width: ScreenUtil().setWidth(4)),
                      image: DecorationImage(
                          image: NetworkImage('https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg')
                      ),
                    ),
                  ),
                  Text('ID或简历中的姓名', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(36)),)
                ],
              )
            )
          )
        ],
      ),
    );
  }
}