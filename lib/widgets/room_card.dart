import 'package:app/models/hub.dart';
import 'package:app/models/room.dart';
import 'package:app/screens/room_screen.dart';
import 'package:app/utils/screen_pusher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class RoomCard extends StatefulWidget {
  final Hub hub;
  final Room room;

  const RoomCard({Key? key, required this.hub, required this.room})
      : super(key: key);

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Ink(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          child: InkWell(
            onTap: () {
              ScreenPusher.pushScreen(
                context,
                RoomScreen(hub: widget.hub, room: widget.room),
              );
            },
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Theme.of(context).hintColor.withAlpha(50),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: Mjpeg(
                      error: (context, error, stack) {
                        return Ink(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).hintColor.withAlpha(50),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            image: const DecorationImage(
                              image: ExactAssetImage(
                                  'assets/images/escape_room_placeholder.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      isLive: true,
                      stream:
                          "http://192.168.70.185:8080/video", // TODO: Not hardcode this
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              left: BorderSide(
                                  color:
                                      Theme.of(context).hintColor.withAlpha(50),
                                  width: 1),
                              right: BorderSide(
                                  color:
                                      Theme.of(context).hintColor.withAlpha(50),
                                  width: 1),
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.room.title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${widget.room.progress}%",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Ink(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          border: Border.all(
                            color: Theme.of(context).hintColor.withAlpha(50),
                            width: 1,
                          ),
                        ),
                        height: 24,
                        child: Row(
                          children: [
                            Expanded(
                              flex: widget.room.progress,
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 100 - widget.room.progress,
                              child: Ink(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
