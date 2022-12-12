import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'dark_mode_checker.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class ShimmerItem extends StatelessWidget {
  const ShimmerItem({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    Color shimmerColor =  isDarkMode() ? Colors.black87 : Colors.white;
    Color baseDark = Colors.grey[700]?? Colors.grey;
    Color baseLight = Colors.grey[300] ?? Colors.grey;
    return SizedBox(
      height: height * 1.3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Shimmer.fromColors(
          baseColor: isDarkMode() ?  baseDark : baseLight,
          highlightColor: shimmerColor,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: height,
                    height: height,
                    color: shimmerColor,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 10,
                          color: shimmerColor,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: double.infinity,
                          height: 10,
                          color: shimmerColor,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 40.0,
                          height: 10,
                          color: shimmerColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
