import 'package:examen_6/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('muestra el calendario y sus tres eventos', (tester) async {
    await tester.pumpWidget(const CalendarApp());

    expect(find.text('Septiembre'), findsOneWidget);
    expect(find.text('2026'), findsOneWidget);
    expect(find.text('Laboratorio Flutter'), findsOneWidget);
    expect(find.text('Exposición de proyecto'), findsOneWidget);
    expect(find.text('Entrega de laboratorio'), findsOneWidget);
  });
}
