import 'package:flutter/material.dart';

class MyScrollable extends StatelessWidget{
  const MyScrollable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scrollable"),
      ),
      body: MyListView()
    );
  }
}

////
class MyListView extends StatelessWidget{
  MyListView({Key? key}) : super(key: key);
  final _MyController = ScrollController(); // 滚动条的控制器，外层定义方便使用
  @override
  Widget build(BuildContext context) {

    // return Scrollbar(
    //   isAlwaysShown: true,
    //   child: ListView.builder( // 元素构造器 ：无限长度
    //     // itemCount: 20, // 最大元素个数
    //     cacheExtent: 200, // 最大缓冲区像素长度
    //     itemExtent: 50, // 定义子控件紧约束
    //     // scrollDirection: Axis.horizontal,
    //     itemBuilder: (context, index){
    //       return Container(
    //         height: 150,
    //         alignment: Alignment.center,
    //         color: Colors.red[index % 2 == 0 ? 200 : 10],
    //         child: Text("$index"),
    //       );
    //     },
    //   ),

      // 可以设置间隔元素的构造器,必须制定生成个数
      // child: ListView.separated(
      //   itemCount: 200,
      //   cacheExtent: 200,
      //   separatorBuilder: (context, index) {
      //     return const Divider(height: 1);
      //   },
      //   itemBuilder: (context, index){
      //     return Container(
      //       height: 50,
      //       alignment: Alignment.center,
      //       color: Colors.red[index % 2 == 0 ? 200 : 10],
      //       child: Text("$index"),
      //     );
      //   },
      // ),
    // );
    // return Scrollbar( // 添加滚动条
    return RefreshIndicator( // 下拉刷新组件
      onRefresh: () async {
        return await Future.delayed(Duration(seconds: 2)); // 方式执行完自动销毁刷新控件
      },
      strokeWidth: 4.0, // 刷新组件宽度
      color: Colors.white, // 刷新组件颜色
      backgroundColor: Colors.red, // 刷新组件背景颜色
      child: Scrollbar(
        // controller: _MyController, // 不需要传递 是通过事件冒泡实现
        child: NotificationListener(
          onNotification: (event){
            return true; // 返回true表示该层处理完了不需要再向外冒泡事件
          },
          child: ListView.builder(
            // physics: BouncingScrollPhysics(), // 滑动到末尾反弹效果 ： IOS 默认配置
            // physics: ClampingScrollPhysics(), // 滑动到末尾没有效果 ： ANDROID 默认配置
            padding: const EdgeInsets.only(bottom: 100),
            itemCount: 20,
            controller: _MyController, // 控制器
            itemBuilder: (context, index){
              return ListTile(
                leading: Icon(Icons.person),
                title: Text("Title"),
                subtitle: Text("Sub Title"),
                trailing: IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () {
                    if (index % 2 == 0) {
                      _MyController.animateTo(0.0, duration: const Duration(seconds: 1), curve: Curves.linear);
                    } else {
                      // 向下跳转200像素
                      _MyController.animateTo(_MyController.offset + 200, duration: const Duration(seconds: 1), curve: Curves.easeInBack);
                    }
                  },
                ),
              );
            },
          ),
        )
      )
    );
  }
}
