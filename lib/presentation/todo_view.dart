/*

TO DO View: responsible for the UI
- use BlocBuilder

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_todo_bloc/presentation/todo_cubit.dart';

import '../domain/models/todo.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  // method to show add todo box
  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              todoCubit.addTodo(textController.text);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // to do cubit

    final todoCubit = context.read<TodoCubit>();

    // scaffold
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddTodoBox(context),
      ),

      // BlocBuilder
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          // display a list view
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              // get individual todo from the todos list
              final todo = todos[index];

              // List tile UI
              return ListTile(
                // text
                title: Text(todo.text),

                // checkbox
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) => todoCubit.toggleCompletion(todo),
                ),

                // delete
                trailing: IconButton(
                  onPressed: () => todoCubit.deleteTodo(todo),
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
