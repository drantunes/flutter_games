import 'package:flutter/material.dart';
import 'package:flutter_games/models/game.dart';
import 'package:flutter_games/repositories/game_repository.dart';
import 'package:flutter_games/widgets/add_comment_sheet.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class GameDetailsPage extends StatefulWidget {
  final Game game;

  const GameDetailsPage({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  State<GameDetailsPage> createState() => _GameDetailsPageState();
}

class _GameDetailsPageState extends State<GameDetailsPage> {
  // updateScreen() {
  //   setState(() {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: const Text('Comentário adicionado!'),
  //         action: SnackBarAction(
  //           label: 'OK',
  //           onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
  //         ),
  //       ),
  //     );
  //   });
  // }

  ValueNotifier<bool> showDescription = ValueNotifier(true);

  getDate(DateTime commentDate) {
    const locale = 'pt_BR';
    return timeago.format(
      commentDate,
      locale: locale,
      allowFromNow: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: widget.game.color,
      appBar: AppBar(
        title: Text(widget.game.name),
        elevation: 0,
        backgroundColor: Colors.black45,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_comment_rounded),
            onPressed: () async {
              // final result = await showModalBottomSheet(
              showModalBottomSheet(
                context: context,
                builder: (_) => AddCommentSheet(
                  game: widget.game, /*onSave: updateScreen*/
                ),
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
              );
              // if (result == 'inserido') {
              //   setState(() {});
              // }
            },
          ),
          ValueListenableBuilder(
            valueListenable: showDescription,
            builder: (context, bool show, _) {
              return IconButton(
                icon: Icon(show ? Icons.subtitles_off : Icons.subtitles),
                onPressed: () => showDescription.value = !showDescription.value,
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(widget.game.image, fit: BoxFit.fitWidth, alignment: Alignment.topCenter),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              children: [
                const SizedBox(height: 250),
                ValueListenableBuilder(
                  valueListenable: showDescription,
                  builder: (context, bool show, _) {
                    return AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),
                      firstChild: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(widget.game.description),
                        ),
                      ),
                      secondChild: const SizedBox.shrink(),
                      crossFadeState: show ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    );
                  },
                ),
                const SizedBox(height: 12),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.calendar_today),
                        title: Text(widget.game.year.toString()),
                      ),
                      const Divider(thickness: 1),
                      ListTile(
                        leading: const Icon(Icons.gamepad),
                        title: Text(widget.game.genre.join(', ')),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rating Community: ${widget.game.ratingMember.toStringAsFixed(0)}%"),
                        LinearProgressIndicator(
                          backgroundColor: Colors.grey.shade300,
                          color: widget.game.color,
                          value: widget.game.ratingMember / 100,
                          minHeight: 8,
                        ),
                        const SizedBox(height: 24),
                        Text("Rating Critic: ${widget.game.ratingCritic.toStringAsFixed(0)}%"),
                        LinearProgressIndicator(
                          backgroundColor: Colors.grey.shade300,
                          color: widget.game.color,
                          value: widget.game.ratingCritic / 100,
                          minHeight: 8,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Consumer<GameRepository>(builder: (context, __, _) {
                  return Card(
                    child: SizedBox(
                      height: (widget.game.comments.isEmpty || widget.game.comments.length < 2) ? 120 : 190,
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 24),
                            child: Text("${widget.game.comments.length} Comentários",
                                style: Theme.of(context).textTheme.headline6),
                          ),
                          ...List.from(
                            widget.game.comments.map(
                              (comment) => ListTile(
                                title: Text(comment.text),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.access_time, size: 16),
                                    const SizedBox(width: 2),
                                    Text(getDate(comment.date)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (widget.game.comments.isEmpty)
                            const ListTile(
                              title: Text("0 Comentários"),
                            ),
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {},
      //   child: const Icon(Icons.add_comment_rounded),
      // ),
    );
  }
}
