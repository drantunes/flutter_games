import 'package:flutter/material.dart';
import 'package:flutter_games/models/game.dart';
import 'package:flutter_games/repositories/game_repository.dart';
import 'package:flutter_games/widgets/game_image_card.dart';
import 'package:flutter_games/widgets/games_grid_view.dart';

class GamePage extends StatelessWidget {
  final gameList = GameRepository.games;

  GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Games'),
      ),
      body: GamesGridView(
        games: List.from(
          gameList.map(
            (Game game) => GameImageCard(
              image: game.image,
              onTap: () => {},
            ),
          ),
        ),
      ),
    );
  }
}
