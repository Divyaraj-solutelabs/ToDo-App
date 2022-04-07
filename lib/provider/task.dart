class Task {
  late  String name;
  bool isDone;

  Task({required this.name, this.isDone: false});

 void toggleIsDone() {
    this.isDone = !this.isDone;
  }
}