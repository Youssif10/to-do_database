// // lib/database/database_service.dart

// import 'package:hive/hive.dart';
// import '../models/task_model.dart';

// class DatabaseService {
//   static const String taskBoxName = 'tasksBox';

//   static Future<void> init() async {
//     await Hive.openBox<Task>(taskBoxName);
//   }

//   static Box<Task> getTaskBox() {
//     return Hive.box<Task>(taskBoxName);
//   }

//   static Future<void> addTask(Task task) async {
//     final box = getTaskBox();
//     await box.add(task);
//   }

//   static Future<void> deleteTask(Task task) async {
//     await task.delete();
//   }

//   static Future<void> updateTask(Task task) async {
//     await task.save();
//   }

//   static List<Task> getAllTasks() {
//     final box = getTaskBox();
//     return box.values.toList();
//   }
// }
