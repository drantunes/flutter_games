import 'package:flutter/material.dart';

class GameImageCard extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const GameImageCard({
    Key? key,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6.0,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(10),
      child: Ink.image(
        image: AssetImage(image),
        child: InkWell(
          splashColor: Theme.of(context).primaryColor.withOpacity(.2),
          highlightColor: Colors.white.withOpacity(.3),
          onTap: onTap,
        ),
      ),
    );
  }
}
