import 'package:flutter/material.dart';
import 'package:flutter_games/pages/game_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.sourceCodeProTextTheme(
          ThemeData.light().textTheme,
        ),
        // brightness: Brightness.dark,
      ),
      home: const GamePage(),
    );
  }
}
