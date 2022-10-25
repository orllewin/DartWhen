# DartWhen

Probably a bad idea but I miss Kotlin's `when` statement/expression and I'm not satisfied with only having Dart's `if` and `switch`, they feel old fashioned and not very expressive. There's is a [proposal in Dart to extend the Switch statement to become an expression](https://github.com/dart-lang/language/issues/703#issuecomment-1262975719) which will improve things massively but it's not here yet.

**Note: I have no idea what I'm doing and I'm very new to Dart**

## Dart's Switch

Dart's current Switch statement is identical to Java's:

```
var x = 3;

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

## Boolean cases

DartWhen also allows you to include boolean expressions as branch cases:

```
var y = when(x, {
  x == null: 0
  1: 11,
  2: 22,
  3: 33,
  x < 10: 44,
  x < 50: 55,
  Default: -1
});
```
