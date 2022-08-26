import 'package:flutter/material.dart';
import 'package:flutter_games/models/game.dart';
import 'package:flutter_games/pages/game_details_page.dart';
import 'package:flutter_games/repositories/game_repository.dart';
import 'package:flutter_games/widgets/game_image_card.dart';
import 'package:flutter_games/widgets/games_grid_view.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final List<Game> gameList;

  @override
  void initState() {
    super.initState();
    gameList = GameRepository().games;
  }

  openDetails(Game game) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => GameDetailsPage(game: game)),
    );
  }

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
              onTap: () => openDetails(game),
            ),
          ),
        ),
      ),
    );
  }
}
