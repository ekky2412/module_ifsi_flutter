import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:module_ifsi_flutter/home/homepage.dart';
import 'package:module_ifsi_flutter/model/todolist_model.dart';

void main() async {
  initiateLocalDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoListModelAdapter());
  await Hive.openBox<TodoListModel>("todolist");
}
