import 'package:flutter/material.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class SkyIconButton extends StatelessWidget {
  /// Background color of button. Default value is primary color.
  final Color? color;

  /// Text color of leading icon, default value is white.
  final Color iconColor;

  /// Text color of button, default value is white.
  final Color? borderColor;

  /// Action or function that called when button pressed.
  final VoidCallback? onTap;

  /// Size of icon, and set as default height & width
  final double size;

  /// Width shape of button, default value is equal to size
  final double? height;

  /// Width shape of button, default value is equal to size
  final double? width;

  /// The radius of the button shape.
  final double? borderRadius;

  final double? borderWidth;

  /// Leading icon inside button.
  final IconData? icon;

  /// Leading icon with Widget
  final Widget? iconWidget;

  /// Change style button to outline mode
  final bool outlineMode;

  final EdgeInsetsGeometry? margin;

  final EdgeInsetsGeometry? padding;

  final double elevation;

  const SkyIconButton({
    Key? key,
    this.color,
    this.iconColor = Colors.white,
    this.onTap,
    this.height,
    this.width,
    this.borderRadius,
    this.icon,
    this.iconWidget,
    this.outlineMode = false,
    this.margin,
    this.padding,
    this.borderColor,
    this.borderWidth,
    this.size = 24,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: elevation,
      child: Container(
        height: height ?? size,
        width: width ?? size,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: (outlineMode)
              ? Theme.of(context).scaffoldBackgroundColor
              : (color ?? Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          border: Border.all(
            color: (outlineMode)
                ? Theme.of(context).primaryColor
                : borderColor ?? Colors.transparent,
            width: borderWidth ?? 1.5,
            style: BorderStyle.solid,
          ),
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          onTap: onTap,
          child: iconWidget ??
              Icon(
                icon,
                color:
                    (outlineMode) ? Theme.of(context).primaryColor : iconColor,
                size: size,
              ),
        ),
      ),
    );
  }
}
