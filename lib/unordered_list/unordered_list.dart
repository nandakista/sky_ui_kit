import 'package:flutter/material.dart';

import 'bullet_text.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class UnorderedList extends StatelessWidget {
  const UnorderedList({
    Key? key,
    required this.data,
    this.titleStyle,
    this.subtitleStyle,
    this.captionData,
    this.captionStyle,
  }) : super(key: key);

  final Map<String, String> data;
  final Map<String, String>? captionData;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final TextStyle? captionStyle;

  @override
  Widget build(BuildContext context) {
    List<BulletText> children = [];

    for (var item in data.entries) {
      String? caption;
      if (captionData?.containsKey(item.key) ?? false) {
        caption = captionData?.entries
            .where((element) => element.key == item.key)
            .first
            .value;
      }
      children.add(
        BulletText(
          secondChild: Text(
            item.value,
            style: subtitleStyle ?? Theme.of(context).textTheme.bodyText2,
          ),
          thirdChild: (caption != null)
              ? Text(
                  caption.toString(),
                  style: captionStyle ??
                      Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                )
              : const SizedBox.shrink(),
          child: Text(
            item.key,
            style: titleStyle ??
                Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      );
    }

    return Column(
      children: children,
    );
  }
}
