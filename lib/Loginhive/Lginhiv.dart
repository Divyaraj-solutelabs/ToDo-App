import 'package:hive/hive.dart';

part 'Lginhiv.g.dart';

@HiveType(typeId: 1)
class Loginch {
  @HiveField(0)
  final String username;

  @HiveField(1)
  final String password;

  Loginch({required this.username, required this.password});
}