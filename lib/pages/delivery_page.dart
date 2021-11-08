/**
 * @ClassName 模板
 * @Author wushaohang
 * @Date 2021-11-3
 **/
import 'package:flutter/material.dart';
import 'package:AI_delivery_app/plugins/screen_fit.dart';
import 'package:AI_delivery_app/components/my_underline_tabIndicator.dart';

class DeliveryPage extends StatefulWidget {
  @override
  DeliveryPageState createState() => DeliveryPageState();
}

class DeliveryPageState extends State<DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              Container(
                color: Color(0xFFCF1000),
                constraints:
                    BoxConstraints.expand(height: ScreenUtil().setHeight(52)),
                child: TabBar(
                    unselectedLabelColor: Color.fromRGBO(255, 255, 255, 0.8),
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: MyUnderlineTabIndicator(),
                    tabs: <Widget>[
                      Tab(text: '投递详情'),
                      Tab(text: '任务管理'),
                      Tab(text: '创建任务')
                    ]),
              )
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xFFCF1000),
      ),
      body: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                child: Container(
                  height: ScreenUtil().setHeight(20),
                  color: Color(0xFFCF1000),
                ),
              ),
              Positioned(
                  child: Container(
                      width: ScreenUtil().setWidth(710),
                      height: ScreenUtil().setHeight(88),
                      decoration: BoxDecoration(
                          color: Color(0xff000000),
                          borderRadius: BorderRadius.all(
                              Radius.circular(ScreenUtil().setWidth(16)))),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[],
                      )))
            ],
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(710),
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(24)),
                    padding: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(30),
                        ScreenUtil().setHeight(40),
                        ScreenUtil().setWidth(30),
                        ScreenUtil().setHeight(30)),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(30)),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Container(
                                width: ScreenUtil().setWidth(450),
                                margin: EdgeInsets.only(
                                    right: ScreenUtil().setWidth(84)),
                                child: Text(
                                  '内容运营 (有声)内容运营 (有声内容运营 (有声',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(32),
                                      color: Color(0xFF2E2E2E),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                '10k-15k',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(30),
                                  color: Color(0xFFCF1000),
                                ),
                              ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(24)),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              Expanded(
                                  child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: ScreenUtil().setWidth(12)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: ScreenUtil().setHeight(10),
                                        horizontal: ScreenUtil().setWidth(14)),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF6F6F8),
                                        borderRadius: BorderRadius.circular(
                                            ScreenUtil().setWidth(6))),
                                    child: Text(
                                      '北京',
                                      style: TextStyle(
                                          color: Color(0xFF767676),
                                          fontSize: ScreenUtil().setSp(24)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: ScreenUtil().setWidth(12)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: ScreenUtil().setHeight(10),
                                        horizontal: ScreenUtil().setWidth(14)),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF6F6F8),
                                        borderRadius: BorderRadius.circular(
                                            ScreenUtil().setWidth(6))),
                                    child: Text(
                                      '本科及以上',
                                      style: TextStyle(
                                          color: Color(0xFF767676),
                                          fontSize: ScreenUtil().setSp(24)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: ScreenUtil().setWidth(12)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: ScreenUtil().setHeight(10),
                                        horizontal: ScreenUtil().setWidth(14)),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF6F6F8),
                                        borderRadius: BorderRadius.circular(
                                            ScreenUtil().setWidth(6))),
                                    child: Text(
                                      '1-3年',
                                      style: TextStyle(
                                          color: Color(0xFF767676),
                                          fontSize: ScreenUtil().setSp(24)),
                                    ),
                                  ),
                                ],
                              )),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: ScreenUtil().setHeight(10),
                                    horizontal: ScreenUtil().setWidth(14)),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(41, 186, 145, 0.08),
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().setWidth(6))),
                                child: Text(
                                  '匹配度 99%',
                                  style: TextStyle(
                                      color: Color(0xFF29BA91),
                                      fontSize: ScreenUtil().setSp(24)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(650),
                          margin: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(20)),
                          child: Text(
                            '军尊 (北京) 科技有限公司',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(26),
                              color: Color(0xFF2E2E2E),
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(650),
                          margin: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(32)),
                          child: Text(
                            '民营企业 · 50-150人 · 互联网/电子商务  计算机软件',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(24),
                              color: Color(0xFF979797),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(26)),
                          child: Divider(
                            color: Color(0xFFF2F2F2),
                            height: ScreenUtil().setHeight(1),
                          ),
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '渠道：前程无忧',
                              style: TextStyle(
                                  color: Color(0xFFA4A4A4),
                                  fontSize: ScreenUtil().setSp(22)),
                            ),
                            Text(
                              '投递时间：2021-10-14 08:00',
                              style: TextStyle(
                                  color: Color(0xFFA4A4A4),
                                  fontSize: ScreenUtil().setSp(22)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
