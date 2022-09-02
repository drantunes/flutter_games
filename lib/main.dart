import 'package:flutter/material.dart';
import 'package:flutter_games/meu_aplicativo.dart';
import 'package:flutter_games/repositories/game_repository.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
  timeago.setLocaleMessages('pt_BR', timeago.PtBrShortMessages());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GameRepository(),
        ),
      ],
      child: const MeuAplicativo(),
    ),
  );
}
