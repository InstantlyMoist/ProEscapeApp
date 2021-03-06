import 'dart:async';

import 'package:app/handlers/http_handler.dart';
import 'package:app/models/hub.dart';
import 'package:app/models/room.dart';
import 'package:app/screens/hub_add_screen.dart';
import 'package:app/utils/screen_pusher.dart';
import 'package:app/widgets/add_room_dialog.dart';
import 'package:app/widgets/drawer.dart';
import 'package:app/widgets/error_dialog.dart';
import 'package:app/widgets/room_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HubScreen extends StatefulWidget {
  final Hub hub;

  const HubScreen({Key? key, required this.hub}) : super(key: key);

  @override
  State<HubScreen> createState() => _HubScreenState();
}

class _HubScreenState extends State<HubScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<Room> _rooms = [];

  Future<void> _loadRooms() async {
    try {
      _rooms = await HTTPHandler.getRooms(widget.hub.ip);
    } on TimeoutException catch (_) {
      Navigator.pop(context);
      // TODO: SHOW error dialog
      showDialog(context: context, builder: (context) => ErrorDialog());
    }
  }

  Future<List<Room>> _getRooms() async {
    return await HTTPHandler.getRooms(widget.hub.ip);
  }

  Future<void> _refresh() async {
    List<Room> rooms = await _getRooms();
    setState(() {
      _rooms = rooms;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const NavDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () => {_key.currentState!.openDrawer()},
        ),
        centerTitle: true,
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FutureBuilder(
          future: _loadRooms(),
          builder: (context, AsyncSnapshot snapshot) {
            print("Has data?" + snapshot.hasData.toString());
            print(_rooms);
            if (_rooms.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return RefreshIndicator(
                onRefresh: _refresh,
                child: ListView.builder(
                  itemCount: _rooms.length + 1,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == _rooms.length) {
                      return const SizedBox(
                        height: 64,
                      );
                    } else {
                      return RoomCard(hub: widget.hub, room: _rooms[index]);
                    }
                  },
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddRoomDialog(hub: widget.hub),
          ).then((value) => _refresh());
        },
      ),
    );
  }
}
