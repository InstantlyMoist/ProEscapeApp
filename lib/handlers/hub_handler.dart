import 'dart:convert';

import 'package:app/data/preferences.dart';
import 'package:app/models/hub.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HubHandler {

  static List<Hub> _hubs = [];

  static Future<void> loadHubs() async {
    _hubs = [];
    String? savedHubs = Preferences.preferences!.getString("hubs");
    if (savedHubs == null) return;
    for (var hub in jsonDecode(savedHubs)) {
      _hubs.add(Hub.fromJson(hub));
    }
  }

  static void addHub(Hub hub) {
    print("Adding server model " + hub.toString());
    _hubs.add(hub);
    _save();
  }

  static void removeHub(Hub hub) {
    print("Removing hub " + hub.toString());
    _hubs.remove(hub);
    _save();
  }

  static void removeHubAtIndex(int index) {
    removeHub(hubs[index]);
  }

  static void _save() {
    Preferences.preferences!.setString("hubs", jsonEncode(_hubs));
  }

  static List<Hub> get hubs => _hubs;
}