import 'package:flutter/material.dart';
import 'package:flutter_games/models/comment.dart';
import 'package:flutter_games/models/game.dart';
import 'package:flutter_games/repositories/game_repository.dart';
import 'package:provider/provider.dart';

class AddCommentSheet extends StatefulWidget {
  final Game game;
  // final void Function() onSave;

  const AddCommentSheet({
    Key? key,
    required this.game,
    // required this.onSave,
  }) : super(key: key);

  @override
  State<AddCommentSheet> createState() => _AddCommentSheetState();
}

class _AddCommentSheetState extends State<AddCommentSheet> {
  final _formKey = GlobalKey<FormState>();
  final _comment = TextEditingController();

  saveComment() {
    if (_formKey.currentState!.validate()) {
      context.read<GameRepository>().addComment(
            widget.game,
            Comment(
              text: _comment.text,
              date: DateTime.now(),
            ),
          );

      Navigator.of(context).pop('inserido');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Add a New Comment',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: TextFormField(
                    // keyboardType: TextInputType.number,
                    minLines: 4,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Escreva seu comentário',
                      // label: Text("Comentário"),
                    ),
                    controller: _comment,
                    validator: (value) {
                      if (value!.isEmpty) return "Escreva um comentário";

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => saveComment(),
                    child: const Text('Salvar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
