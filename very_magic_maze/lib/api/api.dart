import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

enum RequestMethod { POST, GET, DELETE }

class ApiService {
  static String? _gameId;
  static Future<bool> createGame() async {
    try {
      var result = await _makeRequest("/api/create-game");
      _gameId = result["gameId"];
      return true;
    } catch (e) {
      print("Error creating game: Api error");
      return false;
    }
  }

  static Future joinGame() async => await _makeRequest("/api/$_gameId/join");
  static Future getPlayers() async => await _makeRequest("/api/$_gameId/players");

  static const Map<RequestMethod, String> _methods = {
    RequestMethod.POST: "POST",
    RequestMethod.GET: "GET",
    RequestMethod.DELETE: "DELETE"
  };
  static Future _makeRequest(
    String endpoint, {
    RequestMethod method = RequestMethod.GET,
    Map<String, dynamic>? body,
  }) async {
    var apiBaseUrl = "https://very-magic-maze.herokuapp.com/";

    var uri = Uri.parse("$apiBaseUrl/$endpoint");
    var request = http.Request(_methods[method]!, uri);

    request.headers.addAll({
      'Content-Type': 'application/json',
    });

    if (body != null) {
      request.body = jsonEncode(body);
    }

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      return Future.error("Couldn't make request");
    }

    var code = response.statusCode;
    var data = await response.stream.bytesToString();

    try {
      var json = jsonDecode(data);

      if (code == 200 && json["success"] != null && json["success"] as bool == true) {
        return json["data"];
      } else if (json["errorMessage"] != null) {
        return Future.error("${json["errorMessage"]}");
      } else {
        return Future.error("Unknown: ${json["data"]}");
      }
    } catch (e) {
      return Future.error("Unknown: ${e.toString()}");
    }
  }
}
