import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/comic.dart';

class ComicDetailView extends StatelessWidget {
  final ComicItem comicItem;

  const ComicDetailView({super.key, required this.comicItem});

  _showShare() {}

  _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final rawUrl = comicItem.content.rendered;
    final finalUrl = "${rawUrl.substring("<p><img src=\"".length, rawUrl.indexOf("jpg\""))}jpg";

    final topImage = Center(
      child: CachedNetworkImage(
        imageUrl: finalUrl,
        fit: BoxFit.contain,
        placeholder: (context, url) => const CircularProgressIndicator(),
      ),
    );

    final openButton = Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
        child: const Text(
          "Open in CommitStrip.com",
          style: TextStyle(color: Colors.black87),
        ),
        onPressed: () => _launchURL(comicItem.link),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(comicItem.title.rendered),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => _showShare(),
            )
          ],
        ),
        body: Column(
          children: <Widget>[topImage, openButton],
        ));
  }
}
