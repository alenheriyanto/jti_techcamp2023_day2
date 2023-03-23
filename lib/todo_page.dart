import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:techcamp_day2/loading_widget.dart';
import 'package:techcamp_day2/model/todo.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<ToDo> toDoList = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getToDoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: isLoading
          ? loadingWidget()
          : ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context, index) {
                ToDo myToDo = toDoList[index];
                return ListTile(
                  onTap: () {
                    Navigator.pop(context, myToDo);
                  },
                  tileColor: myToDo.completed ? Colors.green : Colors.red,
                  title: Text(myToDo.title),
                  subtitle: Text("${myToDo.completed}"),
                );
              },
            ),
    );
  }

  Future getToDoList() async {
    await Future.delayed(Duration(seconds: 3));
    var url = Uri.https('jsonplaceholder.typicode.com', 'todos');
    var response = await http.get(
      url,
    );

    var body = jsonDecode(response.body);

    for (var d in body) {
      setState(() {
        toDoList.add(ToDo.fromJson(d));
      });
    }

    setState(() {
      isLoading = false;
    });
  }
}
