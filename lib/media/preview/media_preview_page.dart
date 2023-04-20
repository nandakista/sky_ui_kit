import 'package:flutter/material.dart';
import 'package:sky_ui_kit/media/helper/media_helper.dart';
import 'package:sky_ui_kit/media/sky_image.dart';
import 'package:sky_ui_kit/media/sky_video.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class MediaPreviewPage extends StatelessWidget {
  const MediaPreviewPage({
    Key? key,
    required this.url,
    this.title,
    this.titleStyle,
  }) : super(key: key);

  final String url;
  final String? title;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          title ?? 'Media Preview',
          style: titleStyle ??
              TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xff9e9e9e)),
      ),
      body: _determineMedia(url),
    );
  }

  Widget _determineMedia(String path) {
    final mediaType = MediaHelper.getMediaType(path);
    switch (mediaType.type) {
      case MediaType.file:
        return const Center(child: Text('Media Unsupported'));
      case MediaType.image:
        return Center(child: SkyImage(src: mediaType.path));
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
