import 'package:dart_playground/concurrent_vs_parallel.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });
}
