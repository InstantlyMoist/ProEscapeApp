import 'dart:convert';

import 'package:app/handlers/hub_handler.dart';
import 'package:app/screens/room_screen.dart';
import 'package:app/utils/screen_pusher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hub_add_screen.dart';
import 'hub_screen.dart';

class HubListScreen extends StatefulWidget {
  const HubListScreen({Key? key}) : super(key: key);

  @override
  State<HubListScreen> createState() => _HubListScreenState();
}

class _HubListScreenState extends State<HubListScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: Load hubs? idk
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        centerTitle: true,
        title: const Text(
          "Choose hub",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: HubHandler.hubs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(HubHandler.hubs[index].title),
            onTap: () => {
              ScreenPusher.pushScreen(
                context,
                HubScreen(
                  hub: HubHandler.hubs[index],
                ),
              ),
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pop(context);
          ScreenPusher.pushScreen(context, const HubAddScreen());
        },
      ),
    );
  }
}
