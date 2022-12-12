import 'package:flutter/material.dart';

class NumberTile extends StatelessWidget {
  const NumberTile({
    Key? key,
    required this.number,
    this.horizontalSpacing = 8,
    this.verticalSpacing = 4,
    this.margin,
    this.padding,
    this.child,
    this.numberStyle,
  }) : super(key: key);

  final int number;
  final double horizontalSpacing;
  final double verticalSpacing;
  final EdgeInsetsGeometry? margin, padding;
  final Widget? child;
  final TextStyle? numberStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: horizontalSpacing * 2,
                child: Text(
                  '$number.',
                  style: numberStyle ?? Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(width: horizontalSpacing),
              if (child != null) child!
            ],
          ),
        ],
      ),
    );
  }
}
