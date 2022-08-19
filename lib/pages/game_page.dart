import 'package:flutter/material.dart';
import 'package:flutter_games/models/game.dart';
import 'package:flutter_games/repositories/game_repository.dart';

class GamePage extends StatelessWidget {
  final gameList = GameRepository.games;

  GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Games'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          childAspectRatio: 3 / 4,
          children: gameList
              .map(
                (Game game) => GestureDetector(
                  onTap: () => print(game.name),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(game.image),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
