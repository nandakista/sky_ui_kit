import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class PlatformLoadingIndicator extends StatelessWidget {
  const PlatformLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return const Center(child: CupertinoActivityIndicator(radius: 16));
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
