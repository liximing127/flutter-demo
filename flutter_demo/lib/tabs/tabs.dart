import 'package:flutter/material.dart';
import 'package:flutter_demo/account/account_page.dart';
import 'package:flutter_demo/category/category_page.dart';
import 'package:flutter_demo/home/home_page.dart';

import '../setting/setting_page.dart';

class Tabs extends StatefulWidget{
  const Tabs({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TabsState();
}

class _TabsState extends State<Tabs>{
  // 控制当前选项卡变量
  int _currentIndex = 0;
  // 对应选项卡的切换画面
  final _tabPages = [
    const HomePage(),
    const CategoryPage(),
    const SettingPage(),
    const AccountPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 动态获取页面
      body: _tabPages[_currentIndex],
      // 配置底部导航区域
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems, // 导航栏配置
        fixedColor: Theme.of(context).primaryColor, // 图标和文字颜色 默认primaryColor
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex, // 当前选中
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// 配置底部导航条项目
final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: "Home",
    // activeIcon: Icon(Icons.home) // 选中时的Icon配置
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.category),
    label: "Category",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.games),
    label: "Setting",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: "Account",
  ),
];