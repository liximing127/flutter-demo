import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget{
  static get routeName => "404";
  late final Object? arguments;
  NotFoundPage(Object? arguments, {Key? key}) : super(key: key){
    arguments = arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Demo"),
      ),
    );
  }
}