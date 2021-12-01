import 'package:app/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFFFF7B00),
        accentColor: const Color(0xFFFF7B00),
        appBarTheme: const AppBarTheme(
          color: Color(0xFFFF7B00),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFFF7B00),
        ),
        splashColor: const Color(0xFFFFB570).withAlpha(70),
        highlightColor: const Color(0xFFFFb570).withAlpha(50),
        hintColor: const Color(0xFF333333)
      ),
      home: const LoadingScreen(),
    );
  }
}
