import 'package:flutter/material.dart';
import 'main/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green, splashColor: Colors.transparent
      ),
      // theme: ThemeData.light(), // 系统默认主题
      // darkTheme: ThemeData.dark(),
      // highContrastTheme: ThemeData(primarySwatch: Colors.blue),
      // highContrastDarkTheme: ThemeData(primarySwatch: Colors.red),
      // themeMode: ThemeMode.system, // 会根据系统设置自动设置主题
      // home: homePage(), // 配置主页，如果配置默认路由可不配置
      initialRoute: MyRouter.initialRoute, // 初始化路由 "/" 等同于配置home属性
      routes: MyRouter.routeTable, // 配置路由表
      onGenerateRoute: MyRouter.onGenerateRoute, // 生成路由表 ：在路由表中没有匹配时调用
      onUnknownRoute: MyRouter.unKnownRoute, // 未知路由配置 ：home，routes, onGenerate找不到时
      debugShowCheckedModeBanner: false, // 不显示DEBUG
    );
  }
}
