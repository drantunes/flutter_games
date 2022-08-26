import 'package:flutter/material.dart';
import 'package:flutter_games/models/game.dart';
import 'package:flutter_games/widgets/add_comment_sheet.dart';

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
  updateScreen() {
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Comentário adicionado!'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          ),
        ),
      );
    });
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
                  builder: (_) => AddCommentSheet(game: widget.game, onSave: updateScreen),
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                );
                // if (result == 'inserido') {
                //   setState(() {});
                // }
              }),
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
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(widget.game.description),
                  ),
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
                Card(
                  child: SizedBox(
                    height: (widget.game.comments.isEmpty) ? 120 : 220,
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
                              subtitle: Text("Em: ${comment.date}"),
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
                ),
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
