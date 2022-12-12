import 'package:flutter/material.dart';
import 'package:sky_ui_kit/picker/list_extension.dart';
import 'package:sky_ui_kit/picker/picker_data.dart';
import 'package:sky_ui_kit/picker/picker_typedef.dart';
import 'package:sky_ui_kit/picker/sky_filter_chip.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class PickerGridView<T> extends StatefulWidget {
  const PickerGridView({
    Key? key,
    required this.type,
    required this.data,
    required this.child,
    required this.onChanged,
    this.widthItem,
    this.heightItem,
    this.crossAxisSpacing,
    this.mainAxisSpacing = 0.0,
    this.shrinkWrap = false,
    this.physics,
    this.initialValue,
  }) : super(key: key);

  final PickerType type;
  final List<PickerData<T>> data;
  final SMFilterItemBuilder<PickerData<T>> child;
  final SMFilterOnChanged<T> onChanged;
  final double? widthItem;
  final double? heightItem;
  final double? crossAxisSpacing;
  final double mainAxisSpacing;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final PickerData<T>? initialValue;

  @override
  State<PickerGridView<T>> createState() => _PickerGridViewState<T>();
}

class _PickerGridViewState<T> extends State<PickerGridView<T>> {
  List<PickerData<T>> tempData = [];

  @override
  void initState() {
    tempData = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _setInitial();
    return GridView.builder(
      shrinkWrap: widget.shrinkWrap,
      physics: widget.physics,
      itemCount: tempData.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: widget.widthItem ?? 200,
        mainAxisExtent: widget.heightItem ?? 50,
        crossAxisSpacing: widget.crossAxisSpacing ?? 8,
        mainAxisSpacing: widget.mainAxisSpacing,
      ),
      itemBuilder: (context, index) {
        final item = tempData[index];
        return SkyFilterChip(
          isRadio: (widget.type == PickerType.radio) ? true : false,
          onSelected: (isSelected) {
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
              tempData
                  .firstWhereOrNull((element) => element.isSelected)
                  ?.data,
              tempData
                  .where((element) => element.isSelected)
                  .map((e) => e.data)
                  .toList(),
            );
            setState(() {});
          },
          selected: item.isSelected,
          child: widget.child(item),
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
