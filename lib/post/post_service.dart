import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_flutter/models/post_response.dart';

class PostService{
  Future<List<PostResponse>> postData() async{
    var res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    return List<PostResponse>.from(json.decode(res.body).map((x) => PostResponse.fromJson(x)));
  }
}