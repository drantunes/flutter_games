import 'package:flutter/material.dart';

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
  });
}
