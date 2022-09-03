import 'dart:async';
import 'dart:convert';

import 'model/comic.dart';
import 'model/feature_media.dart';

import 'package:http/http.dart' as http;

class Api {
  static Future<List<ComicItem>> fetchList([int page = 1]) async {
    final response =
        await http.get(Uri.parse('https://www.commitstrip.com/en/wp-json/wp/v2/posts?per_page=5&page=$page'));

    var list = json.decode(response.body);
    return list.map<ComicItem>((data) => ComicItem.fromJson(data)).toList();
  }

  static Future<FeaturedMedia> getFeaturedMedia(int featuredMediaId) async {
    final response = await http.get(Uri.parse('https://www.commitstrip.com/en/wp-json/wp/v2/media/$featuredMediaId'));
    final jsonString = await json.decode(response.body);

    return FeaturedMedia.fromJson(jsonString);
  }
}
