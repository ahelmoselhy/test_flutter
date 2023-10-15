import 'package:flutter/material.dart';
import 'package:test_flutter/model/todo.dart';
import 'package:test_flutter/widgets/todo_item.dart';
import '../colors/color.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

var name = 'ahmed';
var age = 15;
var array = ['a', 'b'];
var map = {
  'name': ['ahmed'],
  'age': [20, 23]
};

String getMyName(String name,{String? aa}) {
  return name;  
}
bool isHamada(String name){
  return name == 'Hamada';
}

isAhmed(String name) => name == 'ahmed';

void testFunctionParameter(String name,{int? age,required int? height}){

}

void testFun() {
  if (name == 'ahmed') {
  } else if (age >= 20) {
  } else {}
  switch (age) {
    case 20:
      break;
    case 30:
      break;
  }

  isAhmed('ahmed');

  for (final c in array) {}
  while (age > 5) {
    age--;
  }

  array.where((name) => name.contains('a')).forEach(print);
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  List<ToDo> filteredList = [];
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredList = todoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  void _handleTodoChange(ToDo toDo) {
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }

  void _addNewToDo(String toDoText) {
    setState(() {
      todoList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDoText));
    });
    _textController.clear();
  }

  void _handleTodoDelete(String toDoId) {
    setState(() {
      todoList.removeWhere((todoItem) => todoItem.id == toDoId);
    });
  }

  void _handleSearch(String searchKey) {
    List<ToDo> results = [];
    if (searchKey.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((todo) =>
              todo.todoText!.toLowerCase().contains(searchKey.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredList = results;
    });
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              searchInput(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 20),
                      child: const Text(
                        'All ToDos',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 30),
                      ),
                    ),
                    for (ToDo toDo in filteredList)
                      ToDoItem(
                        toDo: toDo,
                        onToDoChanged: _handleTodoChange,
                        onToDoDeleted: _handleTodoDelete,
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 10.0),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                        hintText: "Add a new to do", border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    _addNewToDo(_textController.text);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      minimumSize: const Size(60, 60),
                      elevation: 10),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget searchInput() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) {
          _handleSearch(value);
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 25),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: grey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu, color: black, size: 30),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("assets/images/profile_images_for_test.jpg"),
            ),
          )
        ],
      ),
    );
  }
}
