import 'package:flutter/material.dart';
import 'package:flutter_games/pages/game_page.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 20,
              ),
            ),
        // brightness: Brightness.dark,
      ),
      home: GamePage(),
    );
  }
}
