import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_games/cache/game_cache.dart';

import 'package:http/http.dart' as http;

import 'package:flutter_games/constants.dart';
import 'package:flutter_games/models/comment.dart';
import 'package:flutter_games/models/game.dart';

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

  _addToGameList(gameList) {
    _games.removeRange(0, _games.length);

    for (var gameItem in gameList) {
      final game = Game.fromJson(gameItem);
      _games.add(game);
    }
    // notifyListeners();
  }

  _convertResponse(String response, Function(dynamic) processResponse) async {
    final resp = jsonDecode(response) as List;
    processResponse(resp);
  }

  Future<void> _syncWithGameApi(String url, GameCache cache, Function(dynamic) processResponse) async {
    final resp = await http.get(Uri.parse(url));

    if (resp.statusCode == 200) {
      final response = resp.body;
      cache.write(url, response);
      _convertResponse(response, processResponse);
    }
  }

  _loadCache(GameCache cache, String url) {
    String response = cache.read(url);
    if (response.isNotEmpty) {
      _convertResponse(response, _addToGameList);
    }
    for (var game in _games) {
      url = '$url/${game.id}/comments';
      response = cache.read(url);
      if (response.isNotEmpty) {
        _convertResponse(response, (response) => _addToGameComments(game, response));
      }
    }
    notifyListeners();
  }

  Future<void> loadGames() async {
    try {
      const url = '$baseApi/games';
      final cache = GameCache();

      await _loadCache(cache, url);
      await _syncWithGameApi(url, cache, _addToGameList);
      await _syncWithCommentsApi();
      notifyListeners();
    } on HttpException catch (error) {
      debugPrint('Erro ao conectar a API: $error');
    } on TimeoutException {
      debugPrint('Timeout excedido ao conectar a API!');
    }
  }

  _addToGameComments(Game game, comments) {
    game.comments = [];

    for (var comment in comments) {
      game.comments.add(
        Comment(
          text: comment['text'] as String,
          date: DateTime.parse(comment['date']),
        ),
      );
      // notifyListeners();
    }
  }

  Future<void> _syncWithCommentsApi() async {
    final List<Future<http.Response>> futureComments = [];

    for (var game in _games) {
      String url = '$baseApi/games/${game.id}/comments';
      futureComments.add(http.get(Uri.parse(url)));
    }
    final List<http.Response> results = await Future.wait(futureComments);

    for (var i = 0; i < results.length; i++) {
      final resp = results[i];
      if (resp.statusCode == 200) {
        final response = resp.body;
        GameCache().write(resp.request!.url.toString(), response);
        _convertResponse(response, (response) => _addToGameComments(_games[i], response));
      }
    }
    // notifyListeners();
  }
}
