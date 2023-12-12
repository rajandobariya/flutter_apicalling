import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_apicalling/modal/post.dart';

class PostService {
  Future<List<Post>> getPhotos() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.org/posts"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<Post> lexicaList =
          jsonData.map((json) => Post.fromJson(json)).toList();
      return lexicaList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
