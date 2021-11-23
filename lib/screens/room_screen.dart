import 'package:app/models/room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatefulWidget {

  final Room room;

  @override
  State<RoomScreen> createState() => _RoomScreenState();

  const RoomScreen({Key? key, required this.room}) : super(key: key);
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SafeArea(
        child: Container (
          child: Text("Dit is vanuit kamer " + widget.room.title),
        ),
      ),
    );
    throw UnimplementedError();
  }
}