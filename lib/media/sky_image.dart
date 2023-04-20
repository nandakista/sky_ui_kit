import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sky_ui_kit/media/preview/media_preview_page.dart';
import 'package:sky_ui_kit/platform_loading_indicator.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class SkyImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;

  /// Handling onTap image and more priority than enablePreview.
  final VoidCallback? onTapImage;

  /// Show the icon close in top-right and handling OnTap Function
  final VoidCallback? onRemoveImage;

  final BorderRadiusGeometry? borderRadius;

  /// BoxFit for your image
  final BoxFit fit;

  /// Enabling preview your image to new page
  final bool enablePreview;

  /// BoxFit for your empty view
  final BoxFit? emptyOrNullFit;

  /// Set custom empty view when src is empty or null
  final Widget? emptyOrNullView;

  /// Set empty image with src url when origin src is empty or null
  final String? emptyOrNullSrc;

  /// Set true if source from local path
  final bool fromFile;

  /// Change color for svg
  final Color? color;

  final String? previewTitle;

  final TextStyle? previewTitleStyle;

  const SkyImage({
    Key? key,
    required this.src,
    this.width,
    this.height,
    this.onTapImage,
    this.onRemoveImage,
    this.borderRadius,
    this.fit = BoxFit.fill,
    this.enablePreview = false,
    this.emptyOrNullFit,
    this.emptyOrNullView,
    this.emptyOrNullSrc,
    this.fromFile = false,
    this.color,
    this.previewTitle,
    this.previewTitleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (src != '' && src != 'null') {
      return DisplayImage(
        url: src.toString(),
        width: width,
        height: height,
        fit: fit,
        borderRadius: borderRadius,
        enablePreview: enablePreview,
        onTapImage: onTapImage,
        onRemoveImage: onRemoveImage,
        fromFile: fromFile,
        color: color,
        previewTitle: previewTitle,
        previewTitleStyle: previewTitleStyle,
      );
    } else {
      return DisplayImage(
        url: emptyOrNullSrc ?? 'assets/img_empty.png',
        width: width,
        height: height,
        fit: emptyOrNullFit ?? BoxFit.contain,
        borderRadius: borderRadius,
        color: color,
        previewTitle: previewTitle,
        previewTitleStyle: previewTitleStyle,
      );
    }
  }
}

class DisplayImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final VoidCallback? onTapImage;
  final VoidCallback? onRemoveImage;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;
  final bool fromFile;
  final Color? color;
  final bool enablePreview;
  final String? previewTitle;
  final TextStyle? previewTitleStyle;

  const DisplayImage({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.onTapImage,
    this.onRemoveImage,
    this.borderRadius,
    this.fit = BoxFit.fill,
    this.enablePreview = false,
    this.fromFile = false,
    this.color,
    this.previewTitle,
    this.previewTitleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFromRemote = url.startsWith('http');
    final isSvg = url.endsWith('svg');

    return Stack(
      children: [
        GestureDetector(
          onTap: enablePreview
              ? () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MediaPreviewPage(
                        url: url,
                        title: previewTitle,
                        titleStyle: previewTitleStyle,
                      ),
                    ),
                  )
              : onTapImage,
          child: isFromRemote
              ? ClipRRect(
                  borderRadius: borderRadius ?? BorderRadius.circular(0),
                  child: CachedNetworkImage(
                    imageUrl: url,
                    height: height,
                    width: width,
                    fit: fit,
                    placeholder: (context, url) => SizedBox(
                      height: height,
                      width: width,
                      child: const Center(
                        child: PlatformLoadingIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => SizedBox(
                      height: height,
                      width: width,
                      child: const Icon(
                        Icons.error,
                      ),
                    ),
                  ),
                )
              : (isSvg)
                  ? SvgPicture.asset(
                      url,
                      width: width,
                      height: height,
                      color: color,
                    )
                  : (fromFile)
                      ? ClipRRect(
                          borderRadius:
                              borderRadius ?? BorderRadius.circular(0),
                          child: Image.file(
                            File(url),
                            width: width,
                            height: height,
                            fit: fit,
                          ),
                        )
                      : ClipRRect(
                          borderRadius:
                              borderRadius ?? BorderRadius.circular(0),
                          child: Image.asset(
                            url,
                            width: width,
                            height: height,
                            fit: fit,
                          ),
                        ),
        ),
        onRemoveImage != null
            ? Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onRemoveImage,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
