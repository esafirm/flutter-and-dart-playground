import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../model/comic.dart';
import '../model/feature_media.dart';
import 'comic_item_action.dart';

class ComicItemView extends StatelessWidget {
  final actions = ComicActions();
  final ComicItem comic;

  ComicItemView(this.comic, {super.key});

  @override
  Widget build(BuildContext context) {
    final title = comic.title.rendered;
    const assetImage = AssetImage("assets/images/commitstrip_logo_small.png");

    final futureImage = FutureBuilder(
      future: actions.getFeaturedMedia(comic.featured_media),
      builder: (context, snapshot) {
        debugPrint('Get image from futur');

        if (snapshot.connectionState != ConnectionState.done || snapshot.error != null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final FeaturedMedia media = snapshot.requireData;
          
          debugPrint("Get the media -- ${media.link}");

          return CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: media.link,
          );
        }
      },
    );

    final backImage = SizedBox.expand(
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.amber),
        child: futureImage,
      ),
    );

    final textTheme = Theme.of(context).textTheme;
    final lowerImage = Positioned(
      left: 20.0,
      bottom: 0.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          const SizedBox(
            width: 80.0,
            child: Image(image: assetImage),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 8.0),
            child: Text(
              title,
              style: textTheme.titleSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    final bottomForeground = Positioned(
      bottom: 0.0,
      child: Container(
        decoration: const BoxDecoration(color: Colors.black87),
        height: 40.0,
        width: 100000.0,
      ),
    );

    return Material(
      child: InkWell(
          onTap: () {
            debugPrint('Inkwell is tapped');
            actions.goToComicDetail(context, comic);
          },
          child: SizedBox(
            height: 160.0,
            child: Stack(
              children: <Widget>[backImage, bottomForeground, lowerImage],
            ),
          )),
    );
  }
}
