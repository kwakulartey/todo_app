import 'dart:convert';

import 'package:http/http.dart';

// get all Todos
class TodoServices {
  Future<Response> getAllTodosRequest() async {
    return await get(
        Uri.parse('https://peaceful-sea-04395.herokuapp.com/todos'));
  }

// create Todo
  Future<Response> createTodoRequest(
      {required String title,
      required String description,
      required String dateTime}) async {
    Map<String, String> header = {'Content-Type': 'application/json'};
    Map<String, String> body = {
      "title": title,
      "description": description,
      "date_time": dateTime
    };
    return await post(
        Uri.parse('https://peaceful-sea-04395.herokuapp.com/todos'),
        body: jsonEncode(body),
        headers: header);
  }

  // Update todo
  Future<Response> updateTodoRequest(
      {required bool status, required String id}) async {
    Map<String, bool> body = {"status": status};
    Map<String, String> header = {'Content- Type': 'application.json'};

    return await patch(
        Uri.parse('https://peaceful-sea-04395.herokuapp.com/todos/$id'),
        body: jsonEncode(body),
        headers: header);
  }

  // delete todo
  Future<Response> deleteTodoRequest(String id) async {
    return await delete(
        Uri.parse('https://peaceful-sea-04395.herokuapp.com/todos/$id'));
  }
}
