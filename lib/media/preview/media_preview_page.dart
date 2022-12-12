import 'package:flutter/material.dart';
import 'package:sky_ui_kit/media/helper/media_helper.dart';
import 'package:sky_ui_kit/media/sky_image.dart';
import 'package:sky_ui_kit/media/sky_video.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class MediaPreviewPage extends StatelessWidget {
  final String url;

  const MediaPreviewPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Media Preview',
          style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
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
        return Center(child: SkyImage(url: mediaType.path));
      case MediaType.video:
        // return VideoPreviewDisplay(
        //   url: mediaType.path,
        //   height: double.infinity,
        //   width: double.infinity,
        // );
        return SkyVideo(
          url: mediaType.path,
          height: double.infinity,
          width: double.infinity,
        );
      case MediaType.unknown:
        return const Center(child: Text('Media Unsupported'));
    }
  }
}
