import 'package:flutter/material.dart';
import 'package:sky_ui_kit/picker/list_extension.dart';
import 'package:sky_ui_kit/picker/picker_typedef.dart';
import 'package:sky_ui_kit/picker/sky_filter_chip.dart';

import 'picker_data.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/

class PickerListView<T> extends StatefulWidget {
  const PickerListView({
    Key? key,
    required this.type,
    required this.data,
    required this.itemBuilder,
    required this.onChanged,
    this.widthItem,
    this.heightItem,
    this.shrinkWrap = false,
    this.physics,
    this.separator,
    this.initialValue,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  final PickerType type;
  final List<PickerData<T>> data;
  final SMFilterItemBuilder<PickerData<T>> itemBuilder;
  final SMFilterOnChanged<T> onChanged;
  final double? widthItem;
  final double? heightItem;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Widget? separator;
  final PickerData<T>? initialValue;
  final Axis scrollDirection;

  @override
  State<PickerListView<T>> createState() => _PickerListViewState<T>();
}

class _PickerListViewState<T> extends State<PickerListView<T>> {
  List<PickerData<T>> tempData = [];

  @override
  void initState() {
    tempData = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _setInitial();
    return ListView.separated(
      shrinkWrap: widget.shrinkWrap,
      physics: widget.physics,
      itemCount: tempData.length,
      scrollDirection: widget.scrollDirection,
      separatorBuilder: (BuildContext context, int index) {
        return widget.separator ?? const SizedBox.shrink();
      },
      itemBuilder: (context, index) {
        final item = tempData[index];
        return SkyFilterChip(
          selected: item.isSelected,
          isRadio: (widget.type == PickerType.radio) ? true : false,
          onSelected: (bool isSelected) {
            if (widget.type != PickerType.multiple) {
              for (var element in tempData) {
                element.isSelected = false;
              }
            }
            tempData = tempData.map(
              (otherChip) {
                return item == otherChip
                    ? otherChip.copy(isSelected: isSelected)
                    : otherChip;
              },
            ).toList();
            widget.onChanged(
              context,
              index,
              tempData.firstWhereOrNull((element) => element.isSelected)?.data,
              tempData
                  .where((element) => element.isSelected)
                  .map((e) => e.data)
                  .toList(),
            );
            setState(() {});
          },
          child: widget.itemBuilder(item),
        );
      },
    );
  }

  void _setInitial() {
    if (widget.initialValue != null) {
      int index = widget.data.indexOf(widget.initialValue!);
      widget.data[index] = PickerData(
        isSelected: true,
        index: widget.initialValue?.index,
        data: widget.initialValue?.data,
      );
      setState(() {});
    }
  }
}
