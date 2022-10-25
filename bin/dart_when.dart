import 'package:dart_when/language.dart';

void main(List<String> arguments) {
  print('DartWhen');

  var x = 3;

  when(x, {
    1: () => print("is 1"),
    2: () => print("is 2"),
    3: () {
      print("is 3");
      print("Code block");
    },
    x > 500: () => print("> 500"),
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
