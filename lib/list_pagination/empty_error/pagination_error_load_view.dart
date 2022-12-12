import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class PaginationErrorLoadView extends StatelessWidget {
  const PaginationErrorLoadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 12),
        Text(
          'Something went wrong',
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          'Tap to try again',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 4),
        Icon(
          CupertinoIcons.refresh_thick,
          color: Colors.grey,
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
