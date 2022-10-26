import 'package:dart_when/when.dart';
import 'package:test/test.dart';

void main() {
  test('basic when statement - int', () {
    var i = 0;

    when(50, {
      40: () => {}, //
      50: () {
        i = 100;
      },
      60: () => {}
    });

    expect(i, 100);
  });

  test('basic when statement - String', () {
    var i = "Hello";
    var w = "Everyone";

    when(i.toLowerCase(), {
      "how' do": () => w = "folk", //
      "hello": () => w = "world",
      "ello": () => w = "duck"
    });

    expect(w, "world");
  });

  test('basic when expression - int', () {
    var i = when(50, {
      40: 40, //
      50: 50,
      60: 60
    });
    expect(i, 50);
  });

  test('basic when expression - String', () {
    var i = when(50, {
      40: "Fourty", //
      50: "Fifty",
      60: "Sixty"
    });
    expect(i, "Fifty");
  });
}
