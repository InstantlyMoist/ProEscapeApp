import 'package:app/widgets/drawer.dart';
import 'package:app/widgets/room_card.dart';
import 'package:flutter/material.dart';

import 'models/room.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

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
          "ProEscape",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RoomCard(
                room: Room(title: "Kamer 1"),
              ),
              RoomCard(
                room: Room(title: "Kamer 2"),
              ),
              RoomCard(
                room: Room(title: "Kamer 3"),
              ),
              RoomCard(
                room: Room(title: "Kamer 4"),
              ),
              RoomCard(
                room: Room(title: "Kamer 5"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
