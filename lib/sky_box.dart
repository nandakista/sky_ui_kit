import 'package:flutter/material.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class SkyBox extends StatelessWidget {
  const SkyBox({
    Key? key,
    required this.child,
    this.margin,
    this.padding,
    this.borderRadius,
    this.width,
    this.height,
    this.onPressed,
    this.color,
    this.gradient,
    this.borderColor,
    this.elevation = 4,
  }) : super(key: key);

  final Widget? child;
  final EdgeInsetsGeometry? margin, padding;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? borderColor;
  final Gradient? gradient;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
      elevation: elevation,
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        onTap: onPressed,
        child: Container(
          padding: padding ?? const EdgeInsets.all(8),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            gradient: gradient,
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            border: Border.all(
              color: borderColor ?? Colors.grey.shade300,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
