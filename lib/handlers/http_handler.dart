import 'dart:convert';
import 'package:app/models/room.dart';
import 'package:http/http.dart' as http;

class HTTPHandler {
  static Future<void> addRoom(String IP, String title) async {
    Uri uri = Uri.parse("http://$IP/api/room");
    print("sending title $title");
    var response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'title': title,
        },
      ),
    );
    print(response);
  }

  static Future<List<Room>> getRooms(String IP) async {
    Uri uri = Uri.parse("http://" + IP + "/api/rooms");
    print("HOI?");
    var response = await http.get(uri).timeout(
          const Duration(seconds: 2),
        );
    print("werkt dit al?");
    var json =
        jsonDecode(response.body); // TODO: Kijken of data wel correct is?
    List<Room> rooms = [];
    json.keys.forEach((roomKey) {
      rooms.add(Room.fromJson(json[roomKey]));
    });
    return rooms;
  }

  static Future<void> startAllPuzzles(String IP, Room room) async {
    for (var puzzleIP in room.puzzles) {
      Uri uri =
          Uri.parse("http://" + IP + "/api/puzzle/start?puzzleID=" + puzzleIP);
      var response = await http.get(uri);
      print(response);
    }
    return;
  }
}
