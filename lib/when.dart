class Default {}

dynamic when<T>(T condition, dynamic branches) {
  if (branches is List) {
    return whenList(condition, branches);
  } else if (branches is Map) {
    return whenMap(condition, branches);
  } else {
    throw Exception("Unsupported branch type: ${branches.runtimeType} - when only supports List and Map branches");
  }
}

dynamic whenList<T>(T condition, List<dynamic> branches) {
  var consumed = false;
  dynamic returnValue;

  for (var element in branches) {
    if (element is Map) {
      var key = element.entries.first.key;
      var value = element.entries.first.value;
      if (!consumed && key.runtimeType == condition.runtimeType && key == condition) {
        if (value is Function) {
          value.call();
          consumed = true;
        } else {
          returnValue = value;
          consumed = true;
        }
      } else if (!consumed && key.runtimeType == bool && key as bool == true) {
        if (value is Function) {
          value.call();
          consumed = true;
        } else {
          returnValue = value;
          consumed = true;
        }
      }
    }
  }

  if (consumed) {
    return returnValue;
  } else {
    if (branches.last.key == Default) {
      branches.last.value.call();
    }
  }
}

dynamic whenMap<T>(T condition, Map<dynamic, dynamic> branches) {
  var consumed = false;
  dynamic returnValue;

  branches.forEach((key, value) {
    if (!consumed && key.runtimeType == condition.runtimeType && key == condition) {
      if (value is Function) {
        value.call();
        consumed = true;
      } else {
        returnValue = value;
        consumed = true;
      }
    } else if (!consumed && key.runtimeType == bool && key as bool == true) {
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
