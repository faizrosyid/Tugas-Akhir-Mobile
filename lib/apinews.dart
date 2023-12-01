import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<News>> getTerbaru() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=1fdc03cd06644ce98b0f5e28fd933b62'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final List<dynamic> jsonData = jsonResponse['articles'];
    List<News> terbaru = jsonData.map((e) => News.fromJson(e)).toList();
    return terbaru;
  } else {
    throw Exception('Gagal Memuat Berita Terbaru');
  }
}

Future<List<News>> getPopuler() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/everything?q=technology&from=2023-11-24&to=2023-11-28&sortBy=popularity&apiKey=1fdc03cd06644ce98b0f5e28fd933b62'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final List<dynamic> jsonData = jsonResponse['articles'];
    List<News> populer = jsonData.map((e) => News.fromJson(e)).toList();
    return populer;
  } else {
    throw Exception('Gagal memuat Berita Populer');
  }
}

class News {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const News({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
