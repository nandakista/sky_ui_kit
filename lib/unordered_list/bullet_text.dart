import 'package:flutter/material.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class BulletText extends StatelessWidget {
  const BulletText({
    Key? key,
    required this.child,
    this.secondChild,
    this.horizontalSpacing = 8,
    this.verticalSpacing = 4,
    this.margin,
    this.padding,
    this.thirdChild,
  }) : super(key: key);

  /// Content that one row with bullet icon
  final Widget child;

  /// Additional idget below the [child]
  final Widget? secondChild;

  /// Additional widget below [secondChild]
  final Widget? thirdChild;

  final double horizontalSpacing;
  final double verticalSpacing;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.circle, size: 8),
              SizedBox(width: horizontalSpacing),
              child,
            ],
          ),
          SizedBox(height: verticalSpacing),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8 + (horizontalSpacing),
            ),
            child: secondChild,
          ),
          SizedBox(height: verticalSpacing / 2),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8 + (horizontalSpacing),
            ),
            child: thirdChild,
          )
        ],
      ),
    );
  }
}
