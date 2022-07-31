import 'package:flutter/material.dart';

import '../exercise/layout_test1.dart';
import '../exercise/scrollable.dart';

class HomePage extends StatefulWidget{
  static String routeName = "home";
  const HomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          textDirection: TextDirection.ltr,
          children: const <Widget>[
             Text("Home Page")
          ],
        ),
        actions: <Widget>[
          IconButton(
            tooltip: "This is Current Alert",
            icon: const Icon(Icons.add_alert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Wrap(
          children: <Widget>[
            MyElevatedButton(title: "Constraints布局约束", widget: const LayoutConstraints()),
            MyElevatedButton(title: "Flex弹性布局", widget: const LayoutFlex()),
            MyElevatedButton(title: "Stack层叠布局", widget: const LayoutStack()),
            MyElevatedButton(title: "自定义布局", widget: const MyLayout()),
            MyElevatedButton(title: "滚动列表动态加载", widget:const MyScrollable()),
          ],
        ),
      )
    );
  }
}

class MyElevatedButton extends StatefulWidget{
  String? _title ;
  Widget? _widget;
  MyElevatedButton({String? title, Widget? widget, Key? key}) : super(key: key){
    _title = title;
    _widget = widget;
  }
  @override
  State<MyElevatedButton> createState() => _MyElevatedButtonState();
}

class _MyElevatedButtonState extends State<MyElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: ElevatedButton(
        child: Text(widget._title ?? ""),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context){
                return widget._widget!;
              }
          )
          );
        },
      ),
    );
  }
}

