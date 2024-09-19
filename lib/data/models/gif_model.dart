class GifModel {
  final String id;
  final String url;
  final String title;

  GifModel({required this.id, required this.url, required this.title});

  factory GifModel.fromJson(Map<String, dynamic> json) {
    return GifModel(
      id: json['id'],
      url: json['images']['original']['url'],
      title: json['title'],
    );
  }
}
