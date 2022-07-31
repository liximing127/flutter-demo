import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget{
  static String routeName = "category";
  const CategoryPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>{
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("category"),
    );
  }
}