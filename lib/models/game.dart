import 'package:flutter/material.dart';
import 'package:flutter_games/models/comment.dart';

class Game {
  int id;
  String name;
  String image;
  List<String> genre;
  String description;
  int year;
  double ratingMember;
  double ratingCritic;
  Color color;
  List<Comment> comments = [];

  Game({
    required this.id,
    required this.name,
    required this.image,
    required this.genre,
    required this.description,
    required this.year,
    required this.ratingMember,
    required this.ratingCritic,
    this.color = const Color(0xFF212121),
    comments,
  });

  static Game fromJson(Map<dynamic, dynamic> gameItem) {
    return Game(
      id: int.parse(gameItem['id']),
      name: gameItem['name'] as String,
      image: gameItem['image'] as String,
      genre: List.from(gameItem['genre'] as List),
      description: gameItem['description'] as String,
      year: gameItem['year'] as int,
      ratingMember: double.parse(gameItem['ratingMember'].toString()),
      ratingCritic: double.parse(gameItem['ratingCritic'].toString()),
      color: Color(int.parse(gameItem['color'])),
    );
  }
}
