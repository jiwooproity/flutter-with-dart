import 'package:flutter/material.dart';

import 'main.dart';
import 'todo.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do Create'),
        actions: [
          IconButton(
            onPressed: () async {
              await todos.add(
                Todo(
                  title: _textEditingController.text,
                  dateTime: DateTime.now().millisecondsSinceEpoch,
                ),
              );

              if(mounted) {
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintStyle: TextStyle(color: Colors.grey[600]),
            hintText: '할 일을 입력하세요.',
            filled: true,
            fillColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}
