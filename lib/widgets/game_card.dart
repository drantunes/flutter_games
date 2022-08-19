import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String image;
  final String name;
  final int year;

  const GameCard({
    Key? key,
    required this.image,
    required this.name,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(4),
              topLeft: Radius.circular(4),
            ),
            child: Image.asset(
              image,
              width: 80,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    year.toString(),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
