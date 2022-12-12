import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sky_ui_kit/platform_loading_indicator.dart';
import 'package:sky_ui_kit/media/preview/media_preview_page.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class SkyImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final VoidCallback? onTapImage;
  final VoidCallback? onRemoveImage;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;
  final bool enablePreview;

  const SkyImage({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.onTapImage,
    this.onRemoveImage,
    this.borderRadius,
    this.fit = BoxFit.fill,
    this.enablePreview = false,
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
                      builder: (context) => MediaPreviewPage(url: url),
                    ),
                  )
              : onTapImage ?? () {},
          child: isFromRemote
              ? ClipRRect(
                  borderRadius: borderRadius ?? BorderRadius.circular(0),
                  child: CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: fit,
                        ),
                      ),
                    ),
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
                    )
                  : ClipRRect(
                      borderRadius: borderRadius ?? BorderRadius.circular(0),
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
