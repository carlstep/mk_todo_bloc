/*

TO DO CUBIT - simple state management
- Each cubit is a list of todos.

*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_todo_bloc/domain/repository/todo_repo.dart';

import '../domain/models/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  // reference the todo repo
  final TodoRepo todoRepo;

  // constructor intializes the cubit with an empty list
  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  // LOAD
  Future<void> loadTodos() async {
    final todoList = await todoRepo.getTodos();

    // emit the fetched list as the new state
    emit(todoList);
  }

  // ADD
  Future<void> addTodo(String text) async {
    // create new todo with unique id
    final newTodo = Todo(
      // id requires int, using '.millisecondsSinceEpoch' turns DateTime to int
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
    );

    // save new todo to repo
    await todoRepo.addTodo(newTodo);

    // re-load
    loadTodos();
  }

  // DELETE
  Future<void> deleteTodo(Todo todo) async {
    // delete todo from the repo
    await todoRepo.deleteTodo(todo);

    // re-load
    loadTodos();
  }

  // TOGGLE (update)

  Future<void> toggleCompletion(Todo todo) async {
    // toggle the complete status of provide todo
    final updatedTodo =
        todo.toggleCompletion(); // logic is in the models of the domain layer

    // update todo in the isar repo
    await todoRepo.updateTodo(updatedTodo);

    // re-load
    loadTodos();
  }
}
