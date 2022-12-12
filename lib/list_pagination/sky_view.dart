import 'package:flutter/material.dart';
import 'package:sky_ui_kit/list_pagination/empty_error/error_view.dart';
import 'package:sky_ui_kit/shimmer/shimmer_detail.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class SkyView extends StatelessWidget {
  const SkyView({
    Key? key,
    required this.loadingEnabled,
    required this.errorEnabled,
    required this.onRetry,
    required this.child,
    this.loadingView,
    this.errorView,
    this.errorMsg,
  }) : super(key: key);

  final bool loadingEnabled;
  final bool errorEnabled;
  final Widget? loadingView;
  final Widget? errorView;
  final Widget child;
  final String? errorMsg;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RefreshIndicator(
        onRefresh: () => Future.sync(onRetry),
        child: SingleChildScrollView(
          child: loadingEnabled
              ? loadingView ?? const ShimmerDetail()
              : (errorEnabled)
                  ? errorView ??
                      ErrorView(
                        isScrollable: false,
                        errorSubtitle: errorMsg,
                        onRetry: onRetry,
                      )
                  : child,
        ),
      ),
    );
  }
}
