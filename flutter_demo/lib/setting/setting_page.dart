import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget{
  static String routeName = "setting";
  const SettingPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>{
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("setting"),
    );
  }
}