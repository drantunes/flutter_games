import 'package:flutter/material.dart';

class ButtonApp extends StatefulWidget {
  const ButtonApp({Key? key}) : super(key: key);

  @override
  State<ButtonApp> createState() => _ButtonAppState();
}

class _ButtonAppState extends State<ButtonApp> {
  bool teste = false;
  final key = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: key,
        body: Builder(builder: (icontext) {
          // debugPrint(MediaQuery.of(icontext).size.toString());

          return RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (event) => debugPrint(event.toString()),
            child: Listener(
              onPointerDown: (event) => debugPrint(event.toStringFull()),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (teste) const Text('Ok'),
                    ElevatedButton(
                      key: const Key('button-test'),
                      onPressed: () => setState(() => teste = true),
                      child: const Text('Test'),
                    ),
                    TextFormField()
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
