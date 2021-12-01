import 'dart:convert';
import 'package:app/models/room.dart';
import 'package:http/http.dart' as http;

class HTTPHandler {
  static Future<List<Room>> getRooms(String IP) async {
    Uri uri = Uri.parse("http://" + IP + "/api/rooms");
    var response = await http.get(uri);

    var json = jsonDecode(response.body); // TODO: Kijken of data wel correct is?
    List<Room> rooms = [];
    json.keys.forEach((roomKey) {
      rooms.add(Room.fromJson(json[roomKey]));
    });
    return rooms;
  }
  
  static Future<void> startAllPuzzles(String IP, Room room) async {
    for (var puzzleIP in room.puzzles) {
      Uri uri = Uri.parse("http://" + IP + "/api/puzzle/start?puzzleID=" + puzzleIP);
      var response = await http.get(uri);
      print(response);
    }
    return;
  }
}
