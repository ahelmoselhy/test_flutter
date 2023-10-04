class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todoList() {
    return [
      ToDo(id: '1', todoText: 'Learning Flutter'),
      ToDo(id: '2', todoText: 'Dependency Injection', isDone: true),
      ToDo(id: '3', todoText: 'Jetpack Compose'),
      ToDo(id: '4', todoText: "Take breakfast", isDone: true),
      ToDo(id: '5', todoText: "Do Exercise", isDone: true),
      ToDo(id: '6', todoText: 'Learning Flutter'),
      ToDo(id: '7', todoText: 'Dependency Injection', isDone: true),
      ToDo(id: '8', todoText: 'Jetpack Compose'),
      ToDo(id: '9', todoText: "Take breakfast", isDone: true),
      ToDo(id: '10', todoText: "Do Exercise", isDone: true),
    ];
  }
}
