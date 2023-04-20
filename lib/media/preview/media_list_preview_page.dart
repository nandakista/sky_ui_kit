import 'package:flutter/material.dart';
import 'package:sky_ui_kit/media/helper/media_helper.dart';
import 'package:sky_ui_kit/media/preview/media_preview_page.dart';
import 'package:sky_ui_kit/media/sky_image.dart';
import 'package:sky_ui_kit/media/sky_video.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class MediaListPreviewPage extends StatelessWidget {
  const MediaListPreviewPage({
    Key? key,
    required this.mediaUrls,
    this.title,
    this.fit,
  }) : super(key: key);

  final List<String> mediaUrls;
  final String? title;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (var item in mediaUrls) {
      children.add(_determineMedia(context, item, fit));
      children.add(const Divider());
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          title ?? 'Media Preview',
          style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xff9e9e9e)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _determineMedia(BuildContext context, String path, BoxFit? fit) {
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
          height: 400,
          showControls: false,
          onTapVideo: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MediaPreviewPage(url: mediaType.path),
            ),
          ),
        );
      case MediaType.unknown:
        return const Center(child: Text('Media Unsupported'));
    }
  }
}
