// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_games/button_app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    const width = 430.0;
    const height = 932.0;
    tester.binding.window.devicePixelRatioTestValue = (3.0);
    tester.binding.platformDispatcher.textScaleFactorTestValue = (1.0);
    final dpi = tester.binding.window.devicePixelRatio;
    tester.binding.window.physicalSizeTestValue = Size(width * dpi, height * dpi);

    await tester.pumpWidget(const ButtonApp());

    // Tap the '+' icon and trigger a frame.
    await tester.tapAt(const Offset(201.3, 465.3));
    await tester.pumpAndSettle();
    await tester.tapAt(const Offset(182.0, 498.0));
    await tester.pump();
    await tester.enterText(find.byType(TextFormField), 'a');
    // await tester.sendKeyUpEvent(const LogicalKeyboardKey(0x00000061));
    // await tester.tap(find.byKey(const Key('button-test')));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Ok'), findsOneWidget);
    expect(find.text('a'), findsOneWidget);
  });
}
