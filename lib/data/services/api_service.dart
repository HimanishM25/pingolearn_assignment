import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/comments_model.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> fetchComments() async {
    final response = await http.get(Uri.parse('$_baseUrl/comments'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}