import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sky_ui_kit/colored_status_bar.dart';
import 'package:sky_ui_kit/media/helper/media_helper.dart';
import 'package:sky_ui_kit/media/sky_image.dart';
import 'package:sky_ui_kit/media/sky_video.dart';
import 'package:sky_ui_kit/media/preview/list_extension.dart';

class ImageCarouselDisplay extends StatelessWidget {
  const ImageCarouselDisplay({
    Key? key,
    required this.url,
    this.title,
    this.initialIndex,
    this.heightBottomWidget,
    this.bottomWidget,
    this.bgColorBottomWidget,
    this.statusBarColor = Colors.black,
    this.statusBarBrightness = Brightness.dark,
    this.fit,
  }) : super(key: key);

  final String? title;
  final int? initialIndex;
  final List<String> url;
  final double? heightBottomWidget;
  final Widget? bottomWidget;
  final Color? bgColorBottomWidget;
  final Color statusBarColor;
  final Brightness statusBarBrightness;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      color: statusBarColor,
      brightness: statusBarBrightness,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title ?? ''),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        body: SafeArea(
          // top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    initialPage: initialIndex ?? 0,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    height: double.infinity,
                  ),
                  items: url.isNullOrEmpty()
                      ? [
                          const SkyImage(
                            src: 'assets/images/img_empty.png',
                            width: double.infinity,
                            height: double.infinity,
                            enablePreview: true,
                            fit: BoxFit.contain,
                          )
                        ]
                      : url.map(
                          (item) {
                            return Center(child: _determineMedia(item, fit));
                          },
                        ).toList(),
                ),
              ),
              if (bottomWidget != null)
                Container(
                  height: heightBottomWidget ?? 100,
                  width: double.infinity,
                  color: bgColorBottomWidget ?? Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: bottomWidget,
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _determineMedia(String path, BoxFit? fit) {
    final mediaType = MediaHelper.getMediaType(path);
    switch (mediaType.type) {
      case MediaType.file:
        return const Center(child: Text('Media Unsupported'));
      case MediaType.image:
        return SkyImage(
          src: mediaType.path,
          fit: fit ?? BoxFit.contain,
        );
      case MediaType.video:
        return SkyVideo(
          src: mediaType.path,
          height: double.infinity,
          width: double.infinity,
        );
      case MediaType.unknown:
        return const Center(child: Text('Media Unsupported'));
    }
  }
}
