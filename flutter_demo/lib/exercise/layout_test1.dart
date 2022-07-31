import 'package:flutter/material.dart';

//// 约束尺寸位置
//// 由程序根组件向下传递尺寸约束，向上传递尺寸
class LayoutConstraints extends StatelessWidget{
  const LayoutConstraints({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Constraints"),
      ),
      body: Center(
        child: Container(
            width: 300,
            height: 300,
            color: Colors.red[200],
            child: Center(
              // 设置布局约束
              // child: SizedBox.expand( // 尽可能占满父级空间
              // child: FractionallySizedBox( // 按比例占满父级空间
              //   widthFactor: 0.5,
              //   heightFactor: 0.5,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                    minHeight: 10,
                    maxHeight: 200,
                    minWidth: 10,
                    maxWidth: double.infinity
                ), // loosen() : 松约束 0>最大值
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    // 获取约束
                    print("constraints $constraints");
                    return const FlutterLogo(size: 50);
                  },
                ),
              ),
            )
        ),
      ),
    );
  }
}

//// 用于自动填充空间
class LayoutFlex extends StatelessWidget{
  const LayoutFlex({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flex Layout"),
      ),
      body: Container(
        width: 200, // 固定约束
        color: Colors.red[200],
        child: Column(
          // MainAxisAlignment.spaceEvenly, // 剩余空间平均分配
          // MainAxisAlignment.spaceBetween, // 剩余空间平均分配在中间
          // MainAxisAlignment.spaceAround // 剩余空间平均分配
          mainAxisSize: MainAxisSize.max, // 尺寸约束内 最大尺寸
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch, // 最大水平延伸
          children: <Widget>[
            FlutterLogo(size: 20),
            Flexible(
              flex: 2,
              child: Container(
                height: 10,
                width: 10,
                color: Colors.red,
              ),
            ),
            FlutterLogo(size: 50),
            Expanded(
              flex: 1,
              child: Container(
                height: 10,
                width: 10,
                color: Colors.red,
              ),
            ),
            FlutterLogo(size: 100),
          ],
        ),
      ),
    );
  }
}

//// 层叠组件Stack, Postion组件精确定位(不占位置)
//// Stack的尺寸 ： 当子组件有固定约束组件时会占用最小空间（孩子组件最大的），当有都是Positioned组件时，有与没办法确认位置默认布满全屏
//// 自动被裁剪的部分不会接受用户的事件
class LayoutStack extends StatelessWidget{
  const LayoutStack({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack Layout"),
      ),
      body: Container(
        color: Colors.red[100],
        // 定义约束
        // constraints: const BoxConstraints(
        //   minWidth: 50,
        //   minHeight: 300,
        //   maxWidth: 50,
        //   maxHeight: 300
        // ),
        child: Stack(
          // fit: StackFit.loose, // 宽约束 ： 允许子组件设置在 0-> 最大约束之间
          // fit: StackFit.expand, // 紧约束 ： 子组件填满上级约束
          clipBehavior: Clip.none, // 溢出不裁剪 ：溢出部分不会接受用户事件
          alignment: Alignment.center,
          children: <Widget>[

            // Positioned(
            //   top: 0,
            //   right: 0,
            //   child: FlutterLogo(size: 50)
            // ),
            Container(
              color: Colors.green[100],
              width: 80,
              height: 80,
            ),
            Text("Stack"),
            Text("Stack Layout"),
            Positioned(
              // 左右都设置组件被拉伸
              // right: 10,
              // left: 10,

              // 当设置宽度超出会自动裁剪
              top: 0,
              left: 10,
              width: 150,
              child: ElevatedButton(
                child: Text(""),
                onPressed: (){},
              ),
            )
          ],
        ),
      ),
    );
  }
}

//// Container 组件 : 没有子元素时越大越好（因为没有子元素可以参照默认最大），但是如果父约束是无穷大约束时，ContainerC尺寸为0

//// CustomMutiChildLayout 自定义Layout
class MyLayout extends StatelessWidget{
  const MyLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout"),
      ),
      // 自定义布局方式
      body: Container(
        color: Colors.red[200],
        child: CustomMultiChildLayout(
          // 布局代理，用来处理自定义布局逻辑
          delegate: _MyDelegate(thick: 8.0),
          children: [
            // LayoutId(id: 1, child: FlutterLogo()),
            // LayoutId(id: 2, child: FlutterLogo(size: 250,)),
            LayoutId(id: "underline", child: Container(color: Colors.red)),
            LayoutId(id: "text", child: const Text("LIXIMING", style: TextStyle(fontSize: 50))),
          ],
        ),
      )
    );
  }
}

class _MyDelegate extends MultiChildLayoutDelegate{
  final double thick;
  _MyDelegate({this.thick = 4.0});
  // 绘制Layout
  late Size size1, size2;
  // 向上传递尺寸，默认返回最大尺寸
  @override
  Size getSize(BoxConstraints constraints) {
    // return super.getSize(constraints); //
    return Size(400,400);
  }
  @override
  void performLayout(Size size) {
    // if (hasChild(1)) {
    //   // 设置子组件约束（此时如果设置子组件大小将无效，除非设置宽约束）
    //   size1 = layoutChild(
    //       1,
    //       const BoxConstraints(minWidth: 100, minHeight: 100, maxHeight: 100, maxWidth: 100),
    //   );
    //   positionChild(1, Offset(0, 0));
    // }
    // if (hasChild(2)) {
    //   // 使用款约束，此时子控件可以有效设置大小
    //   size2 = layoutChild(2, BoxConstraints.loose(size));
    //   positionChild(2, Offset(size1.width, size1.height));
    // }

    // 居中
    late final left;
    late final top;
    if (hasChild("text")) {
      size1 = layoutChild("text", BoxConstraints.loose(size));
      left = (size.width - size1.width) / 2;
      top = (size.height - size1.height) / 2;

      positionChild("text", Offset(left, top));
    }
    if (hasChild("underline")) {
      // layoutChild("underline", BoxConstraints(minWidth: size1.width, minHeight: 2, maxHeight: 2, maxWidth: size1.width));
      layoutChild("underline", BoxConstraints.tight(Size(size1.width, thick)));
      positionChild("underline", Offset(left, top + size1.height));
    }
  }

  // 询问是否调用重新绘制Layout
  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => true;
}

