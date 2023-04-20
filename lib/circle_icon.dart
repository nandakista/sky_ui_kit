import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget icon;
  final double? size;
  final Color? backgroundColor;
  final Color? splashColor;
  final EdgeInsetsGeometry? padding;

  const CircleIcon({
    Key? key,
    this.onTap,
    required this.icon,
    this.backgroundColor = Colors.black,
    this.size = 56,
    this.splashColor = Colors.grey, this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: backgroundColor ?? Colors.black54.withOpacity(0.6),
        child: SizedBox(
          height: size,
          width: size,
          child: IconButton(
            padding: padding ?? EdgeInsets.zero,
            splashRadius: size,
            onPressed: onTap,
            splashColor: splashColor,
            icon: icon,
          ),
        ),
      ),
    );
  }
}