const String columnId = '_id';
const String columnDescription = 'description';

class Memo {
  int? id;
  String? description;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{};

    if (id != null) {
      map[columnId] = id;
    }
    if (description != null) {
      map[columnDescription] = description;
    }
    return map;
  }

  Memo({this.description, this.id});

  Memo.fromMap(Map<String, Object?> map) {
    if (map[columnId] != null) {
      id = int.parse(map[columnId].toString());
    }
    if (map[columnDescription] != null) {
      description = map[columnDescription]?.toString();
    }
  }
}
