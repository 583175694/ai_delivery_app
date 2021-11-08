/**
 * @ClassName 模板
 * @Author wushaohang
 * @Date 2021-11-3
 **/
import 'package:AI_delivery_app/plugins/base.dart';
import 'package:flutter/material.dart';
import 'package:AI_delivery_app/plugins/screen_fit.dart';
import 'package:AI_delivery_app/components/my_underline_tabIndicator.dart';

class DeliveryPage extends StatefulWidget {
  @override
  DeliveryPageState createState() => DeliveryPageState();
}

class DeliveryPageState extends State<DeliveryPage> with Base {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f8),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: dp(0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: ScreenUtil().setHeight(194),
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: BoxDecoration(
                color: Color(0xffCF1000),
              ),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Color(0xFFCF1000),
                      constraints: BoxConstraints.expand(height: dp(52)),
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
                        ]
                      ),
                    )
                  ],
                ),
              )
            )
          ),
          Positioned(
            top: dp(172),
            child: Container(
              width: ScreenUtil().setWidth(710),
              height: ScreenUtil().setHeight(88),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(16)))),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[],
              )
            )
          ),
          Positioned(
            top: dp(194),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    width: dp(710),
                    margin: EdgeInsets.only(bottom: dp(24), left: dp(20), right: dp(20)),
                    padding: EdgeInsets.fromLTRB(dp(30), dp(40), dp(30), dp(30)),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: dp(30)),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Container(
                                width: dp(450),
                                margin: EdgeInsets.only(right: dp(84)),
                                child: Text(
                                  '内容运营 (有声)内容运营 (有声内容运营 (有声',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: dp(32),
                                    color: Color(0xFF2E2E2E),
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '10k-15k',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: dp(30),
                                    color: Color(0xFFCF1000),
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: dp(24)),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: dp(12)),
                                      padding: EdgeInsets.symmetric(
                                          vertical: dp(10),
                                          horizontal: dp(14)
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF6F6F8),
                                          borderRadius: BorderRadius.circular(dp(6))
                                      ),
                                      child: Text(
                                        '北京',
                                        style: TextStyle(
                                            color: Color(0xFF767676),
                                            fontSize: dp(24)
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: dp(12)),
                                      padding: EdgeInsets.symmetric(
                                          vertical: dp(10),
                                          horizontal: dp(14)
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF6F6F8),
                                          borderRadius: BorderRadius.circular(dp(6))
                                      ),
                                      child: Text(
                                        '本科及以上',
                                        style: TextStyle(
                                            color: Color(0xFF767676),
                                            fontSize: dp(24)
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: dp(12)),
                                      padding: EdgeInsets.symmetric(
                                          vertical: dp(10),
                                          horizontal: dp(14)
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF6F6F8),
                                          borderRadius: BorderRadius.circular(dp(6))
                                      ),
                                      child: Text(
                                        '1-3年',
                                        style: TextStyle(
                                            color: Color(0xFF767676),
                                            fontSize: dp(24)
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: dp(10),
                                  horizontal: dp(14)
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(41, 186, 145, 0.08),
                                  borderRadius: BorderRadius.circular(dp(6))
                                ),
                                child: Text(
                                  '匹配度 99%',
                                  style: TextStyle(
                                    color: Color(0xFF29BA91),
                                    fontSize: dp(24)
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: dp(650),
                          margin: EdgeInsets.only(bottom: dp(20)),
                          child: Text(
                            '军尊 (北京) 科技有限公司',
                            style: TextStyle(
                              fontSize: dp(26),
                              color: Color(0xFF2E2E2E),
                            ),
                          ),
                        ),
                        Container(
                          width: dp(650),
                          margin: EdgeInsets.only(bottom: dp(32)),
                          child: Text(
                            '民营企业 · 50-150人 · 互联网/电子商务  计算机软件',
                            style: TextStyle(
                              fontSize: dp(24),
                              color: Color(0xFF979797),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: dp(26)),
                          child: Divider(
                            color: Color(0xFFF2F2F2),
                            height: dp(1),
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
                                fontSize: dp(22)
                              ),
                            ),
                            Text(
                              '投递时间：2021-10-14 08:00',
                              style: TextStyle(
                                color: Color(0xFFA4A4A4),
                                fontSize: dp(22)
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(dp(20)),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
