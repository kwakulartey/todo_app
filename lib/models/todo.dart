// To parse this JSON data, do
//
//     final todo = todoFromMap(jsonString);

import 'dart:convert';

Todo todoFromMap(String str) => Todo.fromMap(json.decode(str));

String todoToMap(Todo data) => json.encode(data.toMap());

class Todo {
  Todo({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Datum> data;

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.status,
    required this.id,
    required this.v,
  });

  String title;
  String description;
  String dateTime;
  bool status;
  String id;
  int v;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        title: json["title"],
        description: json["description"],
        dateTime: json["date_time"],
        status: json["status"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "date_time": dateTime,
        "status": status,
        "_id": id,
        "__v": v,
      };
}
