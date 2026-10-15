import '../lib/data/mock_misiones.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('hay misiones con preguntas', () {
    expect(missions, isNotEmpty);
    expect(missions.every((m) => m.questions.isNotEmpty), isTrue);
  });
}
