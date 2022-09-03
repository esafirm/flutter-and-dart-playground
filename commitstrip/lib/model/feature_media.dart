class FeaturedMedia {
  static const size = 'medium_large';

  late String link;

  FeaturedMedia({
    required this.link,
  });

  FeaturedMedia.fromJson(Map json) {
    link = json['media_details']['sizes'][size]['source_url'];
  }
}
