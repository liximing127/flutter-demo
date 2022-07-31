import 'package:flutter/material.dart';
import 'package:flutter_demo/home/home_page.dart';
import 'package:flutter_demo/pages/maintain.dart';
import 'package:flutter_demo/tabs/tabs.dart';

import '../pages/notfound.dart';

/// 1、如果是 "/" 路由到话，那么将会查找MaterialApp下home属性配置到Widget，如果不存在则使用routers配置到Widget，
/// 2、如果上述都没有说明需要创建路由，调用onGenerateRoute来创建新的
/// 3、如果以上都不匹配则会调用onUnknownRoute
/// 4、如果home，routes，onGenerateRoute，onUnknownRoute全部为空则不会创建任何Navigator

class MyRouter {
  // 路由表配置
  static final Map<String, WidgetBuilder> routeTable = {
    '/': (context)=> const Tabs(),
    '/home': (context)=> const HomePage(),
  };
  // 初始路由
  static String initialRoute = HomePage.routeName;
  // 生成路由
  static RouteFactory get onGenerateRoute => (settings){
    if (settings.name == MaintainPage.routeName) {
      return MaterialPageRoute(
        builder: (content){
          return MaintainPage(settings.arguments);
        }
      );
    }
    return null;
  };
  // 未知路由
  static RouteFactory get unKnownRoute => (settings){
    return MaterialPageRoute(
        builder: (content){
          return NotFoundPage(settings.arguments);
        }
    );
  };
}