import 'package:app/models/room.dart';
import 'package:app/widgets/camera_carousel_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatefulWidget {
  final Room room;

  @override
  State<RoomScreen> createState() => _RoomScreenState();

  const RoomScreen({Key? key, required this.room}) : super(key: key);
}

class _RoomScreenState extends State<RoomScreen> {
  final List<CameraCarouselItem> _cameras = [];

  @override
  void initState() {
    super.initState();

    for (var ip in widget.room.cameras) {
      _cameras.add(
        CameraCarouselItem(ip: ip),
      );
    }
    // TODO Load camera.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.room.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
        child: Column(
          children: [
            SizedBox(
              height: 320,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: _cameras,
              ),
            ),
            Text("Dit is vanuit kamer " + widget.room.title),
            Text("runningStateL " + widget.room.runningState.toString()),
            Text("progress " + widget.room.progress.toString()),
            Text("puzzles " + widget.room.puzzles.toString()),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
