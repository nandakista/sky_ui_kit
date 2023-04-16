import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class PaginationErrorLoadView<ItemType> extends StatelessWidget {
  const PaginationErrorLoadView({
    Key? key,
    required this.pagingController,
    this.title,
    this.description,
  }) : super(key: key);

  final String? title;
  final String? description;
  final PagingController<int, ItemType> pagingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Text(
          title ?? 'Something went wrong',
          style: const TextStyle(color: Colors.grey),
        ),
        TextButton(
          onPressed: () => pagingController.retryLastFailedRequest(),
          child: Text(
            description ?? 'Tap to try again',
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 4),
        const Icon(
          CupertinoIcons.refresh_thick,
          color: Colors.grey,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
