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
}
