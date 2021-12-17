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
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xFFFF7B00),

        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFFFF7B00))
          )
        ),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFFF7B00),
        ),
        buttonColor: const Color(0xFFFF7B00),
        disabledColor: const Color(0xFF333333),
        splashColor: const Color(0xFFFFB570).withAlpha(70),
        highlightColor: const Color(0xFFFFb570).withAlpha(50),
        hintColor: const Color(0xFF333333),
        iconTheme: const IconThemeData(
          color: Color(0xFF333333),
        ),
        primaryIconTheme: const IconThemeData(
          color: Color(0xFF333333),
        ),
        accentIconTheme: const IconThemeData(
          color: Color(0xFF333333),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFFF7B00),
            ),
          ),
          focusColor: Color(0xFFFF7B00),
          labelStyle: TextStyle(
            color: Color(0xFFFF7B00),
          ),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Color(0xFF333333),
          ),
          bodyText2: TextStyle(
            color: Color(0xFF333333),
          ),
          caption: TextStyle(
            color: Color(0xFF333333),
          ),
          headline1: TextStyle(
            color: Color(0xFF333333),
          ),
          headline2: TextStyle(
            color: Color(0xFF333333),
          ),
          headline3: TextStyle(
            color: Color(0xFF333333),
          ),
          headline4: TextStyle(
            color: Color(0xFF333333),
          ),
          headline5: TextStyle(
            color: Color(0xFF333333),
          ),
          headline6: TextStyle(
            color: Color(0xFF333333),
          ),
          overline: TextStyle(
            color: Color(0xFF333333),
          ),
          subtitle1: TextStyle(
            color: Color(0xFF333333),
          ),
          subtitle2: TextStyle(
            color: Color(0xFF333333),
          ),
        ),
      ),
      home: const LoadingScreen(),
    );
  }
}
