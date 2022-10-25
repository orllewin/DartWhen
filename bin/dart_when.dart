import 'package:dart_when/language.dart';

void main(List<String> arguments) {
  print('DartWhen');

  var x = 600;

  when(x, [
    {x > 700: () => print(">> 700")},
    {x > 600: () => print(">> 600")},
    {x > 500: () => print(">> 500")},
    {x > 400: () => print(">> 400")},
  ]);

  switch (x) {
    case 1:
      print("is 1");
      break;
    case 2:
      print("is 2");
      break;
    case 3:
      print("is 3");
      break;
    default:
      print("default - no match");
  }

  when(x, {
    1: () => print("is 1"), //
    2: () => print("is 2"),
    3: () => print("is 3"),
    Default: () => print("default - no match")
  });

  when(x, {
    1: () => print("is 1"),
    2: () => print("is 2"),
    3: () {
      print("is 3");
      print("Code block");
    },
    Default: () => print("default - no match")
  });

  var y = when(x, {
    1: 11, //
    2: 22,
    3: 33,
    x > 500: 0,
    Default: -1
  });

  print("y: $y");
}
