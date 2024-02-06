import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    final todo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );

    emit([...state, todo]);
  }

  void editTodo(String title, String newTitle) {
    final updatedTodos = state.map((todo) {
      if (todo.name == title) {
        todo.name = newTitle;
      }
      return todo;
    }).toList();

    emit(updatedTodos);
  }

  void deleteTodo(String title) {
    final updatedTodos = state.where((todo) => todo.name != title).toList();
    emit(updatedTodos);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
