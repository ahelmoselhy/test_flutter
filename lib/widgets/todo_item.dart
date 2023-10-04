import 'package:flutter/material.dart';
import 'package:test_flutter/colors/color.dart';
import 'package:test_flutter/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo toDo;
  final onToDoChanged;
  final onToDoDeleted;

  const ToDoItem(
      {super.key,
      required this.toDo,
      required this.onToDoChanged,
      required this.onToDoDeleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(toDo);
          print('clicked on to do item');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Icon(
          toDo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: blue,
        ),
        title: Text(
          toDo.todoText!,
          style: TextStyle(
            fontSize: 15,
            color: black,
            decoration: toDo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          height: 35,
          width: 40,
          decoration: BoxDecoration(
            color: red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            icon: const Icon(Icons.delete),
            iconSize: 18,
            color: Colors.white,
            onPressed: () {
              onToDoDeleted(toDo.id);
            },
          ),
        ),
      ),
    );
  }
}
