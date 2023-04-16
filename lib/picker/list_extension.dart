extension ListExt<T> on List<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    final index = indexWhere(test);
    if (index != -1) {
      return this[index];
    }
    return null;
  }
}

extension ListNullExtension<T> on List<T>? {
  bool isNullOrEmpty() {
    if (this == null) {
      return true;
    } else {
      if (this!.isEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }

  T? firstOrNull() {
    if (this != null) {
      if (this!.isNotEmpty) {
        return this![0];
      } else {
        return null;
      }
    }
    return null;
  }
}


