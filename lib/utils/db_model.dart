final String tableTodo = 'todo';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnDone = 'done';
final String columnDescription = 'description';
final String columnDate = 'date';

class Todo {
  int? id;
  String? title;
  String? description;
  DateTime? date;
  bool? done;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{};

    if (id != null) {
      map[columnId] = id;
    }
    if (title != null) {
      map[columnTitle] = title;
    }
    if (description != null) {
      map[columnDescription] = description;
    }
    if (date != null) {
      map[columnDate] = date?.toString().substring(0, 10);
    }
    if (done != null) {
      map[columnDone] = done == true ? 1 : 0;
    }

    return map;
  }

  Todo({this.done, this.title, this.description, this.date, this.id});

  Todo.fromMap(Map<String, Object?> map) {
    if (map[columnId] != null) {
      id = int.parse(map[columnId].toString());
    }
    if (title != null) {
      title = map[columnTitle]?.toString();
    }
    if (map[columnDescription] != null) {
      description = map[columnDescription]?.toString();
    }
    if (map[columnDate] != null) {
      date = DateTime.parse(map[columnDate].toString());
    }
    if (map[columnDone] != null) {
      done = int.parse(map[columnDone].toString()) == 1;
    }
  }
}
