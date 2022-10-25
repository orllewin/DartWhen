import 'package:dart_when/language.dart';

void main(List<String> arguments) {
  print('DartWhen');

  var x = 600;

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

  when(x, {1: () => print("is 1"), 2: () => print("is 2"), 3: () => print("is 3"), Default: () => print("default - no match")});

  when(x, {
    1: () => print("is 1"),
    2: () => print("is 2"),
    3: () {
      print("is 3");
      print("Code block");
    },
    x > 500: () => print("> 500"), //this should execute
    x > 550: () => print("> 550"), //this shouldn't
    Default: () => print("default - no match")
  });

  var y = when(x, {
    1: 11, //
    2: 22,
    3: 33,
    x > 500: 0, //this should execute
    x > 550: -2, //this shouldn't
    Default: -1
  });

  print("y: $y"); //bug: y should be 0, but is -2
}
