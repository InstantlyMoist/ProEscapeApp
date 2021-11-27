import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class CameraCarouselItem extends StatefulWidget {

  final String ip;

  const CameraCarouselItem({Key? key, required  this.ip}) : super(key: key);

  @override
  State<CameraCarouselItem> createState() => _CameraCarouselItemState();
}

class _CameraCarouselItemState extends State<CameraCarouselItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Mjpeg(
        isLive: true,
        stream: "http://${widget.ip}/video",
      ),
    );
  }
}
