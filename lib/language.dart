class Default {}

dynamic when<T>(T condition, Map<dynamic, dynamic> branches) {
  var consumed = false;
  dynamic returnValue;
  branches.forEach((key, value) {
    if (consumed == false && key.runtimeType == condition.runtimeType && key == condition) {
      if (value is Function) {
        value.call();
        consumed = true;
      } else {
        returnValue = value;
        consumed = true;
      }
    } else if (consumed == false && key.runtimeType == bool && key as bool == true) {
      if (value is Function) {
        value.call();
        consumed = true;
      } else {
        returnValue = value;
        consumed = true;
      }
    }
  });

  if (consumed) {
    return returnValue;
  } else {
    if (branches.containsKey(Default)) {
      branches[Default].call();
    }
  }
}
