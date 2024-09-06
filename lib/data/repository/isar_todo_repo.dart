/*

DATABASE REPO
- this implements the todo repo and handles storing, retreiving, updating 
and deleting in the isar db 

*/

import 'package:isar/isar.dart';
import 'package:mk_todo_bloc/data/models/isar_todo.dart';
import 'package:mk_todo_bloc/domain/models/todo.dart';
import 'package:mk_todo_bloc/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {
  // database
  final Isar db;

  IsarTodoRepo(this.db);

  // four methods for the isar db

  // 1 - get todos
  @override
  Future<List<Todo>> getTodos() async {
    // fetch from db
    final todos = await db.todoIsars.where().findAll();

    // return as a list of todos and give to domain layer
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  // 2 - add todos
  @override
  Future<void> addTodo(Todo newTodo) async {
    // convert todo into isar todo
    final todoIsar = TodoIsar.fromDomain(newTodo);

    // so that we can store it in the isar db
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  // 3 - update todos
  @override
  Future<void> updateTodo(Todo todo) async {
    // convert todo into isar todo
    final todoIsar = TodoIsar.fromDomain(todo);

    // so that we can update it in the isar db
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  // 4 - delete todos
  @override
  Future<void> deleteTodo(Todo todo) async {
    // delete an existing todo from isar
    await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }
}
