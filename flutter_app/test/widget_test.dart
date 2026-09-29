// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:civic_games/main.dart';

void main() {
  testWidgets('Arcade landing screen renders', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Play the\npublic square.'), findsOneWidget);
    expect(find.text('Budget Battle'), findsWidgets);
    expect(find.text('The Civic Feed'), findsWidgets);

    await tester.tap(find.text('Library'));
    await tester.pumpAndSettle();
    expect(find.text('Your library'), findsOneWidget);
    expect(find.text('About the creator'), findsOneWidget);
  });
}
