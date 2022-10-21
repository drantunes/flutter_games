import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_games/constants.dart';
import 'package:flutter_games/models/comment.dart';
import 'package:flutter_games/models/game.dart';
import 'package:http/http.dart' as http;

class GameRepository extends ChangeNotifier {
  final List<Game> _games = [];

  UnmodifiableListView<Game> get games => UnmodifiableListView<Game>(_games);

  GameRepository() {
    loadGames();
  }

  Future<bool> addComment(Game game, Comment comment) async {
    final url = Uri.parse('$baseApi/games/${game.id}/comments');

    final response = await http.post(url, body: {
      'gameId': game.id.toString(),
      'text': comment.text,
      'date': comment.date.toString(),
    });

    if (response.statusCode == 201) {
      game.comments.add(comment);
      notifyListeners();
      return true;
    }
    return false;
  }

  loadGames() async {
    final url = Uri.parse('$baseApi/games');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final gameList = jsonDecode(response.body) as List;

      for (var gameItem in gameList) {
        final game = Game.fromJson(gameItem);
        // await loadComments(game);
        _games.add(game);
      }
      notifyListeners();
      await loadComments();
    }
  }

  loadComments() async {
    for (var game in _games) {
      final resp = await http.get(
        Uri.parse('$baseApi/games/${game.id}/comments'),
      );
      if (resp.statusCode == 200) {
        final comments = jsonDecode(resp.body) as List;
        for (var comment in comments) {
          game.comments.add(
            Comment(
              text: comment['text'] as String,
              date: DateTime.parse(comment['date']),
            ),
          );
          notifyListeners();
        }
      }
    }
  }
}
