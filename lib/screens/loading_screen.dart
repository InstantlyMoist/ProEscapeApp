import 'package:app/data/preferences.dart';
import 'package:app/handlers/hub_handler.dart';
import 'package:app/screens/hub_list_screen.dart';
import 'package:app/screens/room_screen.dart';
import 'package:app/utils/screen_pusher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    initAsync();
  }

  void initAsync() async {
    await Preferences.loadPreferences(); // Wait for user preferences to load...
    await HubHandler
        .loadHubs(); // Wait for the hubs to load from the preferences

    await Future.delayed(
      const Duration(seconds: 2),
    );

    Navigator.pop(context);
    ScreenPusher.pushScreen(context, const HubListScreen());
    // TODO: Load shared prefs and display them cool
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(
              height: 32,
            ),
            Text("Aan het laden..."),
          ],
        ),
      ),
    );
  }
}
