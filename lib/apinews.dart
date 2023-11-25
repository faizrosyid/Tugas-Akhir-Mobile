import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<News>> fetchStudents() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/everything?q=apple&from=2023-11-23&to=2023-11-23&sortBy=popularity&apiKey=1fdc03cd06644ce98b0f5e28fd933b62'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final List<dynamic> jsonData = jsonResponse['articles'];
    List<News> students = jsonData.map((e) => News.fromJson(e)).toList();
    return students;
  } else {
    throw Exception('Failed to load students');
  }
}

Future<List<News>> fetchTechNews() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/everything?q=apple&from=2023-11-24&to=2023-11-24&sortBy=popularity&apiKey=1fdc03cd06644ce98b0f5e28fd933b62'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final List<dynamic> jsonData = jsonResponse['articles'];
    List<News> techNews = jsonData.map((e) => News.fromJson(e)).toList();
    return techNews;
  } else {
    throw Exception('Failed to load tech news');
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
