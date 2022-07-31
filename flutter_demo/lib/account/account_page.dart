import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget{
  static String routeName = "account";
  const AccountPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>{
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("account"),
    );
  }
}