import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_d15_flutter/models/todo_item.dart';
import 'package:todo_d15_flutter/services/hive_database.dart';
// import '../models/todo_item.dart';
// import '../services/hive_database.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: ValueListenableBuilder(
        valueListenable: HiveDatabase.getBox().listenable(),
        builder: (context, Box<TodoItem> box, _) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final todo = box.getAt(index);
              return ListTile(
                title: Text(todo!.title),
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (bool? value) {
                    todo.isCompleted = value!;
                    HiveDatabase.updateTodo(index, todo);
                  },
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => HiveDatabase.deleteTodo(index),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Add new todo logic
        },
      ),
    );
  }
}
