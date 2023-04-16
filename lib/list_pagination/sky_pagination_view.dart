import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sky_ui_kit/list_pagination/empty_error/list_empty_view.dart';
import 'package:sky_ui_kit/list_pagination/empty_error/pagination_error_load_view.dart';
import 'package:sky_ui_kit/list_pagination/empty_error/pagination_error_view.dart';
import 'package:sky_ui_kit/shimmer/shimmer_list.dart';

import 'empty_error/pagination_max_item_view.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
typedef ItemWidgetBuilder<ItemType> = Widget Function(
  BuildContext context,
  ItemType item,
  int index,
);

class SkyPaginationView<ItemType> extends StatelessWidget {
  const SkyPaginationView({
    Key? key,
    required this.pagingController,
    required this.itemBuilder,
    required this.onRefresh,
    this.loadingView,
    this.emptyView,
    this.errorView,
    this.errorLoadView,
    this.maxItemView,
    this.emptyImage,
    this.emptyTitle,
    this.emptySubtitle,
    this.errorTitle,
    this.errorSubtitle,
  }) : super(key: key);

  final PagingController<int, ItemType> pagingController;

  // final ItemWidgetBuilder
  final ItemWidgetBuilder<ItemType> itemBuilder;

  final Widget? loadingView;

  /// ** Empty View **
  /// View when data list is empty
  final Widget? emptyView;

  /// ** Error View **
  /// View when all item already loaded
  final Widget? maxItemView;

  /// ** Max Item Indicator/View **
  /// View when initial/first load error
  final Widget? errorView;

  /// ** Error load  ** .
  /// View when load pagination error
  final Widget? errorLoadView;

  final VoidCallback onRefresh;

  final Widget? emptyImage;

  final String? emptyTitle;

  final String? emptySubtitle;

  final String? errorTitle;

  final String? errorSubtitle;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(onRefresh),
      child: PagedListView<int, ItemType>(
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<ItemType>(
          animateTransitions: true,
          firstPageProgressIndicatorBuilder: (ctx) =>
              loadingView ?? const ShimmerList(),
          noItemsFoundIndicatorBuilder: (ctx) =>
              emptyView ??
              ListEmptyView(
                emptyImage: emptyImage,
                emptyTitle: emptyTitle,
                emptySubtitle: emptySubtitle,
              ),
          firstPageErrorIndicatorBuilder: (ctx) =>
              errorView ?? PaginationErrorView(controller: pagingController),
          noMoreItemsIndicatorBuilder: (ctx) =>
              maxItemView ?? const PaginationMaxItemView(),
          newPageErrorIndicatorBuilder: (ctx) =>
          errorLoadView ??
              PaginationErrorLoadView(
                title: errorTitle,
                description: errorSubtitle,
                pagingController: pagingController,
              ),
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}
