import 'package:flutter/material.dart';

class MaintainPage extends StatelessWidget{
  static get routeName => "maintain";
  late final Object? arguments;
  MaintainPage(Object? arguments, {Key? key}) : super(key: key){
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