// ignore_for_file: public_member_api_docs, sort_constructors_first
/*

TO DO Page: responsible for providing cubit to view (UI)
- use BlocProvider

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_todo_bloc/domain/repository/todo_repo.dart';
import 'package:mk_todo_bloc/presentation/todo_cubit.dart';

import 'todo_view.dart';

class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;
  const TodoPage({
    super.key,
    required this.todoRepo,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepo),
      child: const TodoView(),
    );
  }
}
