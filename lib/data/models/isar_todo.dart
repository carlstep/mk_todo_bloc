/*
ISAR TO DO MODEL
- Converts todo model into ISAR todo model that we can store in the ISAR db
*/

import 'package:isar/isar.dart';

import '../../domain/models/todo.dart';

// to generate isar todo onject, run >> dart run build_runner build
part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  // convert Isar object -> pure todo object to use in our app
  Todo toDomain() {
    return Todo(
      id: id,
      text: text,
      isCompleted: isCompleted,
    );
  }

  // convert pure todo object -> Isar object to store in the Isar db
  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}
