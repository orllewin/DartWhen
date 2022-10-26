# DartWhen

Probably a bad idea but I miss Kotlin's `when` statement/expression and I'm not satisfied with only having Dart's `if` and `switch`, they feel old fashioned and not very expressive. There's is a [proposal in Dart to extend the Switch statement to become an expression](https://github.com/dart-lang/language/issues/703#issuecomment-1262975719) which will improve things massively but it's not here yet.

**Warning: This was knocked together in an hour or two then refined a little, I can't vouch for its safety or correctness**

## Usage

You can add `when` to your project using this repo as a [git package dependency](https://dart.dev/tools/pub/dependencies#git-packages):

* Add the repo as a dependency to `pubspec.yaml`:

```
dependencies:
  dart_when:
    git: https://github.com/orllewin/DartWhen.git
```

* Then import:

```
import 'package:dart_when/when.dart';
```

* and use, eg:

```
Future<Stations?> _fetchStations() async {
  final response = await http.get(Uri.https('orllewin.uk', 'stations.json'));

  Stations? stations = when(response.statusCode, {
    200: Stations.fromJson(jsonDecode(response.body)), //
    Default: () => snack("Error loading stations feed")
  });

  return stations;
}
```

__Note the double slash `//` - this tricks Dart Format and prevents it folding the `when` block into a single line__

## Dart's Switch

Dart's current Switch statement is identical to Java's:

```
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
```

The same code with DartWhen:

```
when(x, {
  1: () => print("is 1"),
  2: () => print("is 2"),
  3: () => print("is 3"),
  Default: () => print("default - no match")
});
```

## Expression

Dart's switch can't currently be used as an expression, DartWhen can though:

```
var y = when(x, {
  1: 11,
  2: 22,
  3: 33,
  Default: -1
});
```

## Boolean branch case

DartWhen also allows you to include a boolean expression as a branch case:

```
var y = when(x, {
  1: 11,
  2: 22,
  3: 33,
  x < 10: 44,
  Default: -1
});
```

Adding more than one boolean branch will result in unexpected behaviour, if you want to use multiple boolean branch cases you can use the alternative syntax which is less elegant:

```
when(x, [
  {x > 700: () => print("> 700")},
  {x > 600: () => print("> 600")},
  {x > 500: () => print("> 500")},
  {x > 400: () => print("> 400")}
]);
```
