import 'package:hive/hive.dart';

part 'todolist_model.g.dart';

@HiveType(typeId: 1)
class TodoListModel {
  TodoListModel({
    required this.action,
  });

  @HiveField(0)
  String action;

  @override
  String toString() {
    return action;
  }
}
