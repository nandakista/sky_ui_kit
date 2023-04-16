import 'package:flutter/material.dart';
import 'package:sky_ui_kit/sky_button.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
    this.errorImage,
    this.errorTitle,
    this.errorSubtitle,
    this.onRetry,
    this.isScrollable = true,
    this.retryText,
    this.verticalSpacing = 24,
    this.horizontalSpacing = 24,
    this.imageSize,
    this.titleStyle,
    this.subtitleStyle,
  }) : super(key: key);

  final Widget? errorImage;
  final String? errorTitle;
  final String? errorSubtitle;
  final String? retryText;
  final VoidCallback? onRetry;
  final bool isScrollable;
  final double verticalSpacing;
  final double horizontalSpacing;
  final double? imageSize;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: (isScrollable)
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
            vertical: verticalSpacing, horizontal: horizontalSpacing),
        child: Column(
          children: [
            errorImage ??
                Image.asset(
                  'assets/images/img_error.png',
                  height: imageSize,
                ),
            SizedBox(height: verticalSpacing * 2),
            Text(
              errorTitle ?? 'Something when wrong',
              textAlign: TextAlign.center,
              style: titleStyle ?? Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              errorSubtitle ?? 'Tap to try again',
              textAlign: TextAlign.center,
              style: subtitleStyle,
            ),
            SizedBox(height: verticalSpacing),
            SkyButton(
              wrapContent: true,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              text: retryText ?? 'Retry',
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
