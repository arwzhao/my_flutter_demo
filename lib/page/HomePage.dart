import 'package:flutter/material.dart';

/**
 * @author : zhao
 * @date : 2021/3/24
 * @describe : 主页
 * @file :
 *
 */
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getWidget(context);
  }
}

Widget getWidget(BuildContext context) {
  return new Scaffold(
    //脚手架控件
    appBar: new AppBar(
      //工具栏控件
      title: new Center(
        child: new Text("助手"),
      ),
    ),
    body: ListView(
      children: <Widget>[
        Image.asset(
          "assets/images/main.webp",
          height: 240.0,
          fit: BoxFit.cover,
        ),
        titleSection,
        buttonSection(context),
        textSection
      ],
    ),
  );
}

Widget textSection = Container(
  padding: EdgeInsets.all(32.0),
  child: new Center(
    child: new Text(
        "最近在开发过程中看到很多同学问过这个问题。我想要在网络请求失败的时候弹出一个统一的处理页面告诉用户检查网络连接。由于这个行为可以发生在任何页面，我们当然不希望在每一个页面之中都要重新实现一遍这个逻辑，那样耦合就太高了，这时候我们的第一反应是在网络请求后某个部分统一处理这部分逻辑。"),
  ),
);

Widget titleSection = Container(
  padding: EdgeInsets.all(32.0),
  child: Row(
    //3个child 水平排列
    children: <Widget>[
      //占满剩余空间
      Expanded(
        // 2 个child竖直排列
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Oeschinen Lake Campground",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Kandersteg, Switzerland",
              style: TextStyle(color: Colors.grey[500]),
            )
          ],
        ),
      ),

      Icon(
        Icons.star,
        color: Colors.red[500],
      ),

      Text("41"),
    ],
  ),
);

Widget buttonSection(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildButtonColumn(context, Icons.call, "Call"),
        _buildButtonColumn(context, Icons.near_me, "Route"),
        _buildButtonColumn(context, Icons.share, "Share"),
      ],
    ),
  );
}

/// 构建button
Column _buildButtonColumn(BuildContext context, IconData icon, String label) {
  Color color = Theme.of(context).primaryColor;

  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    //列布局
    children: <Widget>[
      Icon(
        icon,
        color: color,
      ),
      Container(
        margin: EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}
