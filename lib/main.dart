import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// import 'package:flutter_games/button_app.dart';

import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:flutter_games/meu_aplicativo.dart';
import 'package:flutter_games/repositories/game_repository.dart';

void main() async {
  // runApp(const ButtonApp());
  timeago.setLocaleMessages('pt_BR', timeago.PtBrShortMessages());

  await Hive.initFlutter();
  if (!Hive.isBoxOpen('game_cache')) {
    await Hive.openBox('game_cache');
  }

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

  // runApp(
  //   Listener(
  //     onPointerDown: (event) => debugPrint(event.toStringFull()),
  //     child: MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider(
  //           create: (context) => GameRepository(),
  //         ),
  //       ],
  //       child: const MeuAplicativo(),
  //     ),
  //   ),
  // );
}
