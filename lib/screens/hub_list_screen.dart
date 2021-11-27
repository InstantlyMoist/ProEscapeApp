import 'package:app/handlers/hub_handler.dart';
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
  }

  void _removeHub(int index) {
    HubHandler.removeHubAtIndex(index);
    // TODO; actually remove it
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
          return Dismissible(
            direction: DismissDirection.endToStart,
            resizeDuration: const Duration(milliseconds: 200),
            key: ObjectKey(index),
            onDismissed: (direction) {
              _removeHub(index);
            },
            background: Container(
              padding: const EdgeInsets.only(left: 28.0),
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
            ),
            // secondaryBackground: ...,
            child: ListTile(
              title: Text(HubHandler.hubs[index].title),
              onTap: () => {
                ScreenPusher.pushScreen(
                  context,
                  HubScreen(
                    hub: HubHandler.hubs[index],
                  ),
                ),
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          ScreenPusher.pushScreen(context, const HubAddScreen());
        },
      ),
    );
  }
}
