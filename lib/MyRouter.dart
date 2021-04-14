import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_flutter_demo/common/WebViewPage.dart';
import 'file:///E:/project/my_flutter_demo/lib/common/ContainerPage.dart';

/**
 * @author : zhao
 * @date : 2021/3/16
 * @describe : 管理路由
 * @file :
 *
 */
class MyRouter {
  static const homePage = 'app://';

  MyRouter.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  MyRouter.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }

  /**
   * 返回一个布局
   * */
  Widget _getPage(String url, dynamic params) {

    if (url.startsWith('https://') || url.startsWith('http://')) {
      return WebViewPage(url, params: params);
    } else {
      switch (url) {
        case homePage:
          return ContainerPage();
      }
    }
    return null;
  }
}
