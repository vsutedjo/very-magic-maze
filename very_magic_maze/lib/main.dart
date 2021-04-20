import 'package:flutter/material.dart';
import 'package:very_magic_maze/screens/start_screen/start_screen.dart';
import 'package:very_magic_maze/shared/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Very Magic Maze',
      theme: veryMagicMazeTheme,
      home: StartScreen(),
    );
  }
}
