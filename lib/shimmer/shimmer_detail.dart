import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'dark_mode_checker.dart';

class ShimmerDetail extends StatelessWidget {
  const ShimmerDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color baseDark = Colors.grey[700] ?? Colors.grey;
    Color baseLight = Colors.grey[300] ?? Colors.grey;

    return SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: isDarkMode() ? baseDark : baseLight,
        highlightColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildItem(width: double.infinity, height: 200),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildItem(width: 130, height: 18),
                          const SizedBox(
                            height: 8,
                          ),
                          _buildItem(width: 195, height: 18),
                          const SizedBox(
                            height: 8,
                          ),
                          _buildItem(width: 80, height: 18),
                        ],
                      ),
                      _buildItem(width: 30, height: 30)
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildItem(width: double.infinity, height: 60),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildItem(width: 110, height: 110, radius: 10),
                      _buildItem(width: 110, height: 110, radius: 10),
                      _buildItem(width: 110, height: 110, radius: 10),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildItem(width: double.infinity, height: 150),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildItem({
    required double width,
    required double height,
    double? radius,
  }) =>
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
          color: Colors.black45,
        ),
      );
}
