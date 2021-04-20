import 'package:flutter/material.dart';
import 'package:very_magic_maze/screens/game/game_screen.dart';
import 'package:very_magic_maze/shared/theme.dart';

import 'shared/start_screen.dart';

class JoinScreen extends StartScreen {
  final TextEditingController controller = TextEditingController();
  @override
  Widget actionWidget(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.3),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              margin: EdgeInsets.only(right: 20),
              child: TextField(
                controller: controller,
                style: Theme.of(context).textTheme.button,
                decoration: InputDecoration(
                  fillColor: magicMazeGrey,
                  filled: true,
                  hintText: "Nickname",
                  hintStyle: Theme.of(context).textTheme.button.copyWith(color: Colors.white70),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), gapPadding: 0),
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(magicMazeBlue)),
              onPressed: () {
                //TODO /api/$gameId/join-game
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => GameScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text("Join", style: Theme.of(context).textTheme.button),
              ),
            ),
          ],
        ),
      );
}
