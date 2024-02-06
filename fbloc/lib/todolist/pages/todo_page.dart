import 'package:fbloc/todolist/cubit/todo_cubit.dart';
import 'package:fbloc/todolist/models/todo.dart';
import 'package:fbloc/todolist/pages/alert_delete.dart';
import 'package:fbloc/todolist/pages/edit_todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_todo_page.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo Page'),
        ),
        body: Column(children: [
          const Text('List of Todos:'),
          Expanded(child:
              BlocBuilder<TodoCubit, List<Todo>>(builder: (context, todos) {
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditTodoPage(todo: todo),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          AlertDelete.alertDelete(context, todo);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddTodoPage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
