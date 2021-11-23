import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenPusher {

  static void pushScreen(BuildContext context, Widget route) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }

}