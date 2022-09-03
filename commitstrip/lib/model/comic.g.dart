// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsonComic _$DsonComicFromJson(Map<String, dynamic> json) => DsonComic(
      items: (json['items'] as List<dynamic>)
          .map((e) => ComicItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DsonComicToJson(DsonComic instance) => <String, dynamic>{
      'items': instance.items,
    };

ComicItem _$ComicItemFromJson(Map<String, dynamic> json) => ComicItem(
      content: Content.fromJson(json['content'] as Map<String, dynamic>),
      title: Title.fromJson(json['title'] as Map<String, dynamic>),
      featured_media: json['featured_media'] as int,
      link: json['link'] as String,
    );

Map<String, dynamic> _$ComicItemToJson(ComicItem instance) => <String, dynamic>{
      'content': instance.content,
      'title': instance.title,
      'featured_media': instance.featured_media,
      'link': instance.link,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      rendered: json['rendered'] as String,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'rendered': instance.rendered,
    };

Title _$TitleFromJson(Map<String, dynamic> json) => Title(
      rendered: json['rendered'] as String,
    );

Map<String, dynamic> _$TitleToJson(Title instance) => <String, dynamic>{
      'rendered': instance.rendered,
    };
