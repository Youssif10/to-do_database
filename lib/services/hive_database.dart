import 'package:hive_flutter/hive_flutter.dart';
import '../models/todo_item.dart';

class HiveDatabase {
  static const String boxName = 'todos';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoItemAdapter());
    await Hive.openBox<TodoItem>(boxName);
  }

  static Box<TodoItem> getBox() {
    return Hive.box<TodoItem>(boxName);
  }

  static Future<void> addTodo(TodoItem todo) async {
    final box = getBox();
    await box.add(todo);
  }

  static Future<void> updateTodo(int index, TodoItem todo) async {
    final box = getBox();
    await box.putAt(index, todo);
  }

  static Future<void> deleteTodo(int index) async {
    final box = getBox();
    await box.deleteAt(index);
  }
}
