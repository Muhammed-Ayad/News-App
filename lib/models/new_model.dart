import 'package:news_app/models/source_model.dart';

class NewModel {
  final SourceModel source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  NewModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewModel.fromJson(Map<String, dynamic> jsonData) {
    return NewModel(
      source: SourceModel.fromJson(jsonData['source'] ?? ''),
      author: jsonData['author'] ?? '',
      title: jsonData['title'] ?? '',
      description: jsonData['description'] ?? '',
      url: jsonData['url'] ?? '',
      urlToImage: jsonData['urlToImage'] ?? '',
      publishedAt: DateTime.parse(jsonData['publishedAt'] ?? ''),
      content: jsonData['content'] ?? '',
    );
  }
}
