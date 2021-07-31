import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'info.dart';

String Url = 'http://futuramaapi.herokuapp.com/api/v2/characters';

List<dynamic> oldVar = [];
getAllnews() async {
  await http.get(
      Uri.parse(Url),
      headers: {
        'Content-Type': 'application/json',
      }).then((value) {
    final response = value;
    if (response.statusCode == 200) {
      if (json.decode(response.body) != null)
        oldVar = json.decode(response.body);
    } else {
      log("Response: ${response.body.toString()} Status code: ${response.statusCode}",
          name: "Stories Helper - Get all news");
    }
  });
}