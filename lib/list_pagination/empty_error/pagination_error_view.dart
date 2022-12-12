import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sky_ui_kit/sky_button.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class PaginationErrorView extends StatelessWidget {
  const PaginationErrorView({Key? key, required this.controller})
      : super(key: key);
  final PagingController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset('assets/images/img_error.png'),
            const SizedBox(height: 24),
            Text(
              'Something when wrong',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            const Text(
              'Tap to try again',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SkyButton(
              wrapContent: true,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              text: 'Retry',
              onPressed: () => controller.retryLastFailedRequest(),
            ),
          ],
        ),
      ),
    );
  }
}
