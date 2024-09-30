import 'package:hive/hive.dart';

part 'todo_item.g.dart';

@HiveType(typeId: 0)
class TodoItem extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late bool isCompleted;

  TodoItem({required this.title, this.isCompleted = false});
}
