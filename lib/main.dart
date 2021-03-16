import 'package:flutter/material.dart';
import 'package:my_flutter_demo/Page1.dart';
import 'package:my_flutter_demo/Page2.dart';
/**
  * @author : zhao
  * @date : 2021/3/16
  * @describe : 主页
  * @file :
  *
  */
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Page1(),

      ///注册路由表
      routes: {
        "/page2": (context) => Page2(),
      },
    );
  }
}
