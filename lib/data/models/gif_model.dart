// Gif Model
class GifModel {
  final String id;
  final String url;
  final String title;
  bool isFavorite;

  GifModel({
    required this.id,
    required this.url,
    required this.title,
    this.isFavorite = false, // Not favourite by default
  });

  factory GifModel.fromJson(Map<String, dynamic> json) {
    return GifModel(
      id: json['id'],
      url: json['images']['original']['url'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'title': title,
    };
  }
}
