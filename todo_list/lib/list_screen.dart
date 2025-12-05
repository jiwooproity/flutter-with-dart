import 'package:flutter/material.dart';
import 'package:todo_list/create_screen.dart';

import 'main.dart';
import 'todo.dart';
import 'todo_item.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: ListView(
        children: todos.values
            .map(
              (todo) => TodoItem(
                todo: todo,
                onTap: (todo) async {
                  todo.isDone = !todo.isDone;
                  await todo.save();
                  setState(() {});
                },
                onDelete: (todo) async {
                  await todo.delete();
                  setState(() {});
                },
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );

          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
