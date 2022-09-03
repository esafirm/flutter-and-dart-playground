import 'package:json_annotation/json_annotation.dart';

part 'comic.g.dart';

@JsonSerializable()
class DsonComic {
  List<ComicItem> items;

  DsonComic({required this.items});
  factory DsonComic.fromJson(Map<String, dynamic> maps) => _$DsonComicFromJson(maps);
}

@JsonSerializable()
class ComicItem {
  final Content content;
  final Title title;
  final int featured_media;
  final String link;

  ComicItem({
    required this.content,
    required this.title,
    required this.featured_media,
    required this.link,
  });

  factory ComicItem.fromJson(Map<String, dynamic> json) => _$ComicItemFromJson(json);
}

@JsonSerializable()
class Content {
  final String rendered;

  Content({required this.rendered});
  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
}

@JsonSerializable()
class Title {
  final String rendered;

  Title({required this.rendered});
  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);
}
