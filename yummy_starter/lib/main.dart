import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yummy/constants.dart';
import 'package:yummy/home_view.dart';

void main(List<String> args) {
  runApp(const Yummy());
}

class Yummy extends StatefulWidget {
  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.blue;

  void changeTheme() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.light
              ? ThemeMode
                  .dark // theme mode = Light Mode
              : ThemeMode.light; // theme mode = dark mode
    });
  }

  void changeColorSeed(int index) {
    setState(() {
      colorSelected = ColorSelection.values[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        brightness: Brightness.light, //
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, //
        colorSchemeSeed: colorSelected.color, //
      ),
      home: HomeView(
        changeTheme: changeTheme,
        colorSchemeSeedChange: changeColorSeed,
        colorSelected: colorSelected,
      ), //
    );
  }
}
