import 'package:flutter/material.dart';

class GamesGridView extends StatelessWidget {
  final List<Widget> games;

  const GamesGridView({
    Key? key,
    required this.games,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 3 / 4,
        children: games,
      ),
    );
  }
}
