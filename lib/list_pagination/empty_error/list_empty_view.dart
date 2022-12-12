import 'package:flutter/material.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class ListEmptyView extends StatelessWidget {
  const ListEmptyView({
    Key? key,
    this.emptyImage,
    this.emptyTitle,
    this.emptySubtitle,
    this.isScrollable = true,
  }) : super(key: key);

  final Widget? emptyImage;
  final String? emptyTitle;
  final String? emptySubtitle;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        physics: (isScrollable)
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        child: Column(
          children: [
            emptyImage ?? Image.asset('assets/images/img_empty.png'),
            const SizedBox(height: 24),
            Text(
              emptyTitle ?? 'Your list is empty!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                emptySubtitle ?? 'Sorry, list data is empty. Maybe go back latter',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
