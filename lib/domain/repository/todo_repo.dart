/*

The TO DO repository - define what the app can do.

use abstract class << a base class to build on top of
- define what the class can do

*/

import '../models/todo.dart';

abstract class TodoRepo {
// four methods
  // 1 - get a list of all todos
  Future<List<Todo>> getTodos();

  // 2 - add a new todo
  Future<void> addTodo(Todo newTodo);

  // 3 - update an existing todo
  Future<void> updateTodo(Todo todo);

  // 4 - delete a todo
  Future<void> deleteTodo(Todo todo);
}

/*

Notes:  
- The repo inside the domain layer outines what operations the app can do, 
  but doesn't worry about the specific implementation details, that's for the
  data layer.

- Everything in the domain layer should be technology agnostic.


*/
