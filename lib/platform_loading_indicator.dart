import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class PlatformLoadingIndicator extends StatelessWidget {
  const PlatformLoadingIndicator({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return Center(
        child: CupertinoActivityIndicator(radius: 16, color: color),
      );
    } else {
      return Center(child: CircularProgressIndicator(color: color));
    }
  }
}
