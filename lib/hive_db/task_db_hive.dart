import 'package:hive/hive.dart';

part 'task_db_hive.g.dart';

@HiveType(typeId: 0)
class DataModel extends HiveObject{
  @HiveField(0)
  final String taskname;

  @HiveField(1)
    final bool complete;

  DataModel({required this.taskname, required this.complete});

}

