/**
 * @ClassName 模板
 * @Author wushaohang
 * @Date 2021-11-3
 **/
import 'package:AI_delivery_app/components/position_bar_chart.dart';
import 'package:AI_delivery_app/components/salary_pie_chart.dart';
import 'package:AI_delivery_app/components/channel_bar_chart.dart';
import 'package:AI_delivery_app/entity/dog.dart';
import 'package:AI_delivery_app/plugins/base.dart';
import 'package:AI_delivery_app/plugins/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with Base {
  Dog? dogRes;
  int channelTab = 0;
  int positionTab = 0;

  @override
  void initState() {
    super.initState();

    requestDog();
  }

  // 模拟请求
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

  // 渠道分析Tab切换
  void switchChannelTab(int index) {
    setState(() {
      channelTab = index;
    });
  }

  // 热门职位分析Tab切换
  void switchPositionTab(int index) {
    setState(() {
      positionTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _textFont = TextStyle(color: Color(0xff2E2E2E), fontSize: dp(32), fontWeight: FontWeight.w500);
    TextStyle _descFont = TextStyle(color: Color(0xff979797), fontSize: dp(24), fontWeight: FontWeight.w400);
    TextStyle _tipsFont = TextStyle(color: Color(0xff979797), fontSize: dp(22), fontWeight: FontWeight.w400);
    TextStyle _tabNormalFont = TextStyle(color: Color(0xff2E2E2E), fontSize: dp(30), fontWeight: FontWeight.w500);
    TextStyle _tabActiveFont = TextStyle(color: Color(0xffffffff), fontSize: dp(30), fontWeight: FontWeight.w500);

    return Scaffold(
      appBar: AppBar(
        title: Text('精准投报告', style: TextStyle(color: Colors.white)),
        elevation: 0,
        backgroundColor: Color(0xffCF1000)
      ),
      backgroundColor: Color(0xffF6F6F8),
      body: ListView(
        children: <Widget>[
          // 本周统计
          Container(
            width: dp(710),
            height: dp(488),
            margin: EdgeInsets.only(left: dp(20), right: dp(20), top: dp(24)),
            padding: EdgeInsets.symmetric(vertical: dp(50)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: dp(40), right: dp(30)),
                          child: Image.asset('lib/assets/icons/icon_delivery.png', width: dp(100), height: dp(100),)
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: dp(32),
                            margin: EdgeInsets.only(bottom: dp(20)),
                            child: Text('10000', style: _textFont),
                          ),
                          Container(
                            height: dp(28),
                            child: Text('本周为您自动投递的职位数量', style: _descFont),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: dp(40), right: dp(30)),
                          child: Image.asset('lib/assets/icons/icon_search.png', width: dp(100), height: dp(100),)
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: dp(32),
                            margin: EdgeInsets.only(bottom: dp(20)),
                            child: Text('20000', style: _textFont),
                          ),
                          Container(
                            height: dp(28),
                            child: Text('本周为您自动搜索的职位数量', style: _descFont),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: dp(40), right: dp(30)),
                          child: Image.asset('lib/assets/icons/icon_match.png', width: dp(100), height: dp(100),)
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: dp(32),
                            margin: EdgeInsets.only(bottom: dp(20)),
                            child: Text('80%', style: _textFont),
                          ),
                          Container(
                            height: dp(28),
                            child: Text('搜索职业与投递职位的匹配度', style: _descFont),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(dp(20))
            ),
          ),
          // 今日统计
          Container(
            width: dp(710),
            height: dp(180),
            margin: EdgeInsets.only(left: dp(20), right: dp(20), top: dp(24)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: dp(234),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: dp(20)),
                        height: dp(28),
                        child: Text('今日搜索', style: _descFont)
                      ),
                      Container(
                        height: dp(32),
                        child: Text('200', style: _textFont)
                      ),
                    ],
                  ),
                ),
                Container(
                  width: dp(2),
                  height: dp(72),
                  color: Color(0xfff2f2f2),
                ),
                Container(
                  width: dp(234),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: dp(20)),
                          height: dp(28),
                          child: Text('今日投递', style: _descFont)
                      ),
                      Container(
                          height: dp(32),
                          child: Text('130', style: _textFont)
                      ),
                    ],
                  ),
                ),
                Container(
                  width: dp(2),
                  height: dp(72),
                  color: Color(0xfff2f2f2),
                ),
                Container(
                  width: dp(234),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: dp(20)),
                          height: dp(28),
                          child: Text('进行中的任务', style: _descFont)
                      ),
                      Container(
                          height: dp(32),
                          child: Text('1', style: _textFont)
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(dp(20))
            ),
          ),
          // 渠道分析
          Container(
            width: dp(710),
            margin: EdgeInsets.only(left: dp(20), right: dp(20), top: dp(24)),
            padding: EdgeInsets.only(left: dp(40), right: dp(40), top: dp(38), bottom: dp(50)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: dp(58),
                      child: Center(child: Text('渠道分析', style: _textFont)),
                    ),
                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              width: dp(112),
                              height: dp(58),
                              child: Center(child: Text('今日', style: channelTab == 0 ? _tabActiveFont : _tabNormalFont)),
                              decoration: BoxDecoration(
                                color: channelTab == 0 ? Color(0xffCF1000) : Color(0xffffffff),
                              ),
                            ),
                            onTap: () => switchChannelTab(0),
                          ),
                          GestureDetector(
                            child: Container(
                              width: dp(112),
                              height: dp(58),
                              child: Center(child: Text('本周', style: channelTab == 1 ? _tabActiveFont : _tabNormalFont)),
                              decoration: BoxDecoration(
                                  color: channelTab == 1 ? Color(0xffCF1000) : Color(0xffffffff),
                                  border: Border.symmetric(vertical: BorderSide(color: Color(0xffCF1000), width: dp(1)))
                              ),
                            ),
                            onTap: () => switchChannelTab(1),
                          ),
                          GestureDetector(
                            child: Container(
                              width: dp(112),
                              height: dp(58),
                              child: Center(child: Text('本月', style: channelTab == 2 ? _tabActiveFont : _tabNormalFont)),
                              decoration: BoxDecoration(
                                color: channelTab == 2 ? Color(0xffCF1000) : Color(0xffffffff),
                              ),
                            ),
                            onTap: () => switchChannelTab(2),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(dp(6)),
                        border: Border.all(color: Color(0xffCF1000))
                      ),
                    )
                  ],
                ),
                Container(
                  width: dp(600),
                  height: dp(198),
                  margin: EdgeInsets.only(top: dp(10)),
                  child: ChannelBarChart.withSampleData(),
                ),
                Container(
                  margin: EdgeInsets.only(top: dp(32)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: dp(14),
                        height: dp(14),
                        margin: EdgeInsets.only(right: dp(10)),
                        decoration: BoxDecoration(
                            color: Color(0xFF4F89FF),
                            borderRadius: BorderRadius.circular(dp(4))
                        ),
                      ),
                      Text('智联招聘', style: _tipsFont),
                      Container(
                        width: dp(14),
                        height: dp(14),
                        margin: EdgeInsets.only(right: dp(10), left: dp(40)),
                        decoration: BoxDecoration(
                            color: Color(0xFFF4B50A),
                            borderRadius: BorderRadius.circular(dp(4))
                        ),
                      ),
                      Text('前程无忧', style: _tipsFont),
                      Container(
                        width: dp(14),
                        height: dp(14),
                        margin: EdgeInsets.only(right: dp(10), left: dp(40)),
                        decoration: BoxDecoration(
                            color: Color(0xFF29BA91),
                            borderRadius: BorderRadius.circular(dp(4))
                        ),
                      ),
                      Text('58同城', style: _tipsFont),
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(dp(20))
            ),
          ),
          // 薪资分析
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
          // 热门职位分析
          Container(
            width: dp(710),
            margin: EdgeInsets.only(left: dp(20), right: dp(20), top: dp(24), bottom: dp(30)),
            padding: EdgeInsets.only(left: dp(40), right: dp(40), top: dp(38), bottom: dp(50)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: dp(58),
                      child: Center(child: Text('热门职位分析', style: _textFont)),
                    ),
                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              width: dp(112),
                              height: dp(58),
                              child: Center(child: Text('智联', style: positionTab == 0 ? _tabActiveFont : _tabNormalFont)),
                              decoration: BoxDecoration(
                                color: positionTab == 0 ? Color(0xffCF1000) : Color(0xffffffff),
                              ),
                            ),
                            onTap: () => switchPositionTab(0),
                          ),
                          GestureDetector(
                            child: Container(
                              width: dp(112),
                              height: dp(58),
                              child: Center(child: Text('前程', style: positionTab == 1 ? _tabActiveFont : _tabNormalFont)),
                              decoration: BoxDecoration(
                                  color: positionTab == 1 ? Color(0xffCF1000) : Color(0xffffffff),
                                  border: Border.symmetric(vertical: BorderSide(color: Color(0xffCF1000), width: dp(1)))
                              ),
                            ),
                            onTap: () => switchPositionTab(1),
                          ),
                          GestureDetector(
                            child: Container(
                              width: dp(112),
                              height: dp(58),
                              child: Center(child: Text('58', style: positionTab == 2 ? _tabActiveFont : _tabNormalFont)),
                              decoration: BoxDecoration(
                                color: positionTab == 2 ? Color(0xffCF1000) : Color(0xffffffff),
                              ),
                            ),
                            onTap: () => switchPositionTab(2),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(dp(6)),
                          border: Border.all(color: Color(0xffCF1000))
                      ),
                    )
                  ],
                ),
                Container(
                  width: dp(600),
                  height: dp(420),
                  margin: EdgeInsets.only(top: dp(10)),
                  child: PositionBarChart.withSampleData(),
                ),
              ],
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