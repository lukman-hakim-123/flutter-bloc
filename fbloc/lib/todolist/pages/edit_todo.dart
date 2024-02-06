import 'package:fbloc/todolist/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;
  EditTodoPage({super.key, required this.todo});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  late TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController(text: widget.todo.name);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Enter title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                )),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context
                    .read<TodoCubit>()
                    .editTodo(widget.todo.name, _titleController.text.trim());
                Navigator.of(context).pop();
              },
              child: const Text('Edit Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
