import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:counterapp/post.dart';
import 'package:flutter/foundation.dart';

class NetWorkRequest {
  static const String url = 'https://jsonplaceholder.typicode.com/posts';
  static List<Post> parsePosr(String responseBody) {
    var list = jsonDecode(responseBody) as List<
        dynamic>; // khởi tạo một list có để lưu các key và value trong file json
    List<Post> posts = list.map((e) => Post.fromJson(e)).toList();
    // tạo ra một List<Post> sau đó đẩy dữ liệu từ list trên vào file pots
    //Post.fromJson có nghĩa là giải mã file Json để đấy vào list
    return posts;
  }

  static Future<List<Post>> fetchPost() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(parsePosr, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Cant get post');
    }
  }
}
