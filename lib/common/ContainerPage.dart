import 'package:flutter/material.dart';
import 'package:my_flutter_demo/common/YColors.dart';
import 'package:my_flutter_demo/page/DataStatisticsPage.dart';
import 'package:my_flutter_demo/page/HomePage.dart';
import 'package:my_flutter_demo/page/MinePage.dart';
import 'package:my_flutter_demo/page/WaitHandlePage.dart';

/**
 * @author : zhao
 * @date : 2021/3/16
 * @describe : 这个页面是作为整个APP的最外层的容器，以Tab为基础控制每个item的显示与隐藏
 * @file :
 *
 */
class ContainerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContainerPageState();
  }
}

class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}

/**
 * tab切换事件
 * */
class _ContainerPageState extends State<ContainerPage> {
  List<Widget> pages;

  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);

  final itemNames = [
    _Item('功能', 'assets/images/tab_one_pressed.png',
        'assets/images/tab_one_normal.png'),
    _Item('待处理', 'assets/images/tab_two_pressed.png',
        'assets/images/tab_two_normal.png'),
    _Item('数据统计', 'assets/images/tab_three_pressed.png',
        'assets/images/tab_three_normal.png'),
    _Item('我的', 'assets/images/tab_four_pressed.png',
        'assets/images/tab_four_normal.png')
  ];

  List<BottomNavigationBarItem> itemList;

  @override
  void initState() {
    super.initState();
    print('initState _ContainerPageState');
    if (pages == null) {
      pages = [
        HomePage(),
        WaitHandlePage(),
        DataStatisticsPage(),
        MinePage(),
      ];
    }
    if (itemList == null) {
      itemList = itemNames
          .map((item) => BottomNavigationBarItem(
              icon: Image.asset(
                item.normalIcon,
                width:18,
                height: 22,
              ),
              title: Text(
                item.name,
                style: TextStyle(fontSize: 10.0),
              ),
              activeIcon:
                  Image.asset(item.activeIcon, width: 18, height:22)))
          .toList();
    }
  }

  int _selectIndex = 0;

//Stack（层叠布局）+Offstage组合,解决状态被重置的问题
  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }

  @override
  void didUpdateWidget(ContainerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    print('build _ContainerPageState');
    return Scaffold(
      body: new Stack(
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
          _getPagesWidget(3),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
        iconSize: 24,
        currentIndex: _selectIndex,
        fixedColor: YColors.color_009dff,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
