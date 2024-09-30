import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_d15_flutter/controllers/task_controller.dart';
import 'package:todo_d15_flutter/views/home_view.dart';
import 'services/hive_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDatabase.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskController(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To-Do App',
        home: HomeView(),
      ),
    );
  }
}
