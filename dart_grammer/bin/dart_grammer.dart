import 'package:dart_grammer/dart_grammer.dart' as dart_grammer;
import 'package:test/test.dart';

void main() {
  Future.wait([
    // 2秒后返回结果
    Future.delayed(Duration(seconds: 2), () {
      return "hello";
    }),
    // 4秒后返回结果
    Future.delayed(Duration(seconds: 4), () {
      return " world";
    })
  ]).then((results){
    print(results[0]+results[1]);
  }).catchError((e){
    print(e);
  });
}
void printInfo() {
  print("自定义方法");
}

printInfo1(Function p) {
  p();
}

// 可选参数
void function(String arg1, [String? arg2]) {
}
