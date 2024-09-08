/*

A TO DO MODEL
- this is what a todo object is

Properties for the todo object
- id
- text
- isCompleted

Methods:  toggle isCompleted >> on/off

*/

class Todo {
  final int id;
  final String text;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.text,
    this.isCompleted = false, // initial state is false
  });

  Todo toggleCompletion() {
    return Todo(
      id: id,
      text: text,
      // toggles isCompleted >> !isCompleted (if true, becomes false; is false, becomes true)
      isCompleted: !isCompleted,
    );
  }
}
