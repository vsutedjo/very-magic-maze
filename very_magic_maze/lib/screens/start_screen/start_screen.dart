import 'package:flutter/material.dart';
import 'package:very_magic_maze/shared/theme.dart';

abstract class StartScreen extends StatelessWidget {
  Widget actionWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.height * 0.3,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 3),
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) => Container(
              decoration: BoxDecoration(
                color: index == 0
                    ? magicMazeMagenta
                    : index == 4
                        ? magicMazeBlue
                        : index == 8
                            ? magicMazeGreen
                            : magicMazeGrey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1, bottom: MediaQuery.of(context).size.height * 0.05),
          child: Text(
            "Welcome to the Very Magic Maze!",
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
        actionWidget(context),
      ],
    ));
  }
}
