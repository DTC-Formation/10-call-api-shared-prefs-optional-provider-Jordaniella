import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  final int userId;
  final String title;
  final String description;

  Post({required this.userId, required this.title, required this.description});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      userId: json['userId'], title: json['title'], description: json['body']);

  Future<Post> fetchPost() async {
    final baseUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts/2");
    final response = await http.get(baseUrl);

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception("Impossible de charger les posts");
    }
  }

  Future<Post> createPost(String title, String body) async {
    Map<String, dynamic> request = {
      'title': title,
      'body': body,
      'userId': "1"
    };
    final baseUrl = Uri.parse("hhttps://jsonplaceholder.typicode.com/posts/1");
    final response = await http.post(baseUrl, body: request);
    if (response.statusCode == 201) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception("Impossible de charger les posts");
    }
  }

  Future<Post> updatePost(String title, String body) async {
    Map<String, dynamic> request = {'title': title, 'body': body, 'userId': 1};
    final baseUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    final response = await http.put(baseUrl, body: request);
    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception("Impossible de charger les posts");
    }
  }

  Future<Post?> deletPost() async {
    final baseUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    final response = await http.delete(baseUrl);
    if (response.statusCode == 200) {
      return null;
    } else {
      throw Exception("Impossible de charger les posts");
    }
  }
}
