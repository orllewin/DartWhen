import 'package:dart_when/when.dart';
import 'package:test/test.dart';

void main() {
  test('basic when expression', () {
    var i = when(50, {40: 40, 50: 50, 60: 60});
    expect(i, 50);
  });
}
