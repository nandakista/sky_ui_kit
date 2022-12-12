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
  }) : super(key: key);

  final Widget? errorImage;
  final String? errorTitle;
  final String? errorSubtitle;
  final String? retryText;
  final VoidCallback? onRetry;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: (isScrollable)
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            errorImage ?? Image.asset('assets/images/img_error.png'),
            const SizedBox(height: 24),
            const SizedBox(height: 24),
            Text(
              errorTitle ?? 'Something when wrong',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              errorSubtitle ?? 'Tap to try again',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
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
