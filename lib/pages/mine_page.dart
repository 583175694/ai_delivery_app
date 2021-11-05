/**
 * @ClassName 模板
 * @Author wushaohang
 * @Date 2021-11-3
 **/
import 'package:AI_delivery_app/model/mine_model.dart';
import 'package:AI_delivery_app/plugins/screen_fit.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  MinePageState createState() => MinePageState();
}

class MinePageState extends State<MinePage> {
  List<MineList> mineList = [];

  // 跳转我的账号
  void toAccount() {
    print('跳转我的账号');
  }

  // 跳转新消息通知
  void toNotification() {
    print('跳转新消息通知');
  }

  // 跳转购买记录
  void toRecord() {
    print('跳转购买记录');
  }

  // 跳转关于我们
  void toAbout() {
    print('跳转关于我们');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mineList = [
      new MineList('lib/assets/icons/icon_account.png', '我的账号', toAccount),
      new MineList('lib/assets/icons/icon_new_message.png', '新消息通知', toNotification),
      new MineList('lib/assets/icons/icon_purchase.png', '购买记录', toRecord),
      new MineList('lib/assets/icons/icon_about_us.png', '关于我们', toAbout),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的', style: TextStyle(color: Colors.white),),
        elevation: 0,
        backgroundColor: Color(0xffCF1000),
      ),
      backgroundColor: Color(0xfff6f6f8),
      body: Stack(
        children: [
          // 头部信息
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
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(50)),
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
          ),
          // 主体部分
          Positioned(
            top: ScreenUtil().setWidth(210),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 会员权限
                Container(
                  width: ScreenUtil().setWidth(710),
                  height: ScreenUtil().setHeight(110),
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset(
                            'lib/assets/icons/icon_vip.png',
                            width: ScreenUtil().setWidth(34),
                            height: ScreenUtil().setWidth(36)
                        ),
                        margin: EdgeInsets.only(left: ScreenUtil().setWidth(33), right: ScreenUtil().setWidth(30)),
                      ),
                      Text('无精准投会员权限', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Color(0xff2e2e2e))),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: ScreenUtil().setWidth(30)),
                          child: Container(
                            width: ScreenUtil().setWidth(116),
                            height: ScreenUtil().setWidth(58),
                            child: Center(
                              child: Text('购买', style: TextStyle(fontSize: ScreenUtil().setSp(28), color: Colors.white))
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffE9513D),
                              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(6))
                            ),
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
                    color: Colors.white
                  ),
                ),
                // 我的列表
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                  width: ScreenUtil().setWidth(710),
                  height: ScreenUtil().setHeight(443),
                  child: myContent(),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
                      color: Colors.white
                  ),
                )
              ],
            )
          ),

          // 许可证
          Positioned(
            bottom: ScreenUtil().setHeight(40),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                  child: Text('人力资源服务许可证    |    营业执照', style: TextStyle(fontSize: ScreenUtil().setSp(24), color: Color(0xff979797)),)
                ),
                Text('京ICP备16069044号', style: TextStyle(fontSize: ScreenUtil().setSp(22), color: Color(0xff979797)),)
              ],
            ),
          )
        ],
      ),
    );
  }

  // 我的列表
  Widget myContent() {
    List<Widget> tiles = [];
    for (int i = 0; i < mineList.length; i++) {
      MineList item = mineList[i];
      tiles.add(
        GestureDetector(
          child: Container(
            width: ScreenUtil().setWidth(710),
            height: ScreenUtil().setHeight(110),
            child: Row(
              children: [
                Container(
                  child: Image.asset(
                      item.icon,
                      width: ScreenUtil().setWidth(34),
                      height: ScreenUtil().setWidth(36)
                  ),
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(33), right: ScreenUtil().setWidth(30)),
                ),
                Text(item.title, style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Color(0xff2e2e2e))),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: ScreenUtil().setWidth(30)),
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                        'lib/assets/icons/icon_enter.png',
                        width: ScreenUtil().setWidth(12),
                        height: ScreenUtil().setWidth(22)
                    ),
                    alignment: Alignment.centerRight,
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                border: i != mineList.length - 1 ? Border(bottom: BorderSide(color: Color(0xffF2F2F2), width: 1)) : null
            ),
          ),
          onTap: () => item.action(),
        ),
      );
    }
    return Column(
      children: tiles,
    );
  }
}