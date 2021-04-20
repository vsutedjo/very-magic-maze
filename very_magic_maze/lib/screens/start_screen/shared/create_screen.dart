import 'package:flutter/material.dart';
import 'package:very_magic_maze/shared/theme.dart';

import '../start_screen.dart';
import 'join_screen.dart';

class CreateScreen extends StartScreen {
  @override
  Widget actionWidget(BuildContext context) => TextButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(magicMazeBlue)),
        onPressed: () {
          //TODO send /api/$gameId/create-game
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => JoinScreen()));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text("Create game", style: Theme.of(context).textTheme.button),
        ),
      );
}
