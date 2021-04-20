import 'package:flutter/material.dart';
import 'package:very_magic_maze/shared/theme.dart';

import 'file:///D:/Misceallneous/Sonstiges/very-magic-maze/very_magic_maze/lib/screens/start_screen/create_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Very Magic Maze',
      theme: veryMagicMazeTheme,
      home: CreateScreen(),
    );
  }
}
