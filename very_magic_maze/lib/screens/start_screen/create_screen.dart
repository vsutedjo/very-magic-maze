import 'package:flutter/material.dart';
import 'package:very_magic_maze/api/api.dart';
import 'package:very_magic_maze/shared/theme.dart';

import 'join_screen.dart';
import 'shared/start_screen.dart';

class CreateScreen extends StartScreen {
  @override
  Widget actionWidget(BuildContext context) => TextButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(magicMazeBlue)),
        onPressed: () async {
          if (await ApiService.createGame()) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => JoinScreen()));
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) => Dialog(
                child: Text("Error creating game. Try again"),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text("Create game", style: Theme.of(context).textTheme.button),
        ),
      );
}
