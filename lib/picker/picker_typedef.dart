import 'package:flutter/material.dart';

enum PickerType {
  single,
  multiple,
  radio,
}

typedef SMFilterItemBuilder<T> = Widget Function(
  T item,
);

typedef SMFilterOnChanged<T> = Function(
  BuildContext context,
  int index,
  T? lastItem,
  List<T?> listItem,
);
