import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_flutter/models/post_response.dart';

class PostService{
  Future<List<PostResponse>> postData() async{
    var res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    return await compute(deserializePostResponse,res.body);
  }

  List<PostResponse> deserializePostResponse(String data) {
    return List<PostResponse>.from(json.decode(data).map((x) => PostResponse.fromJson(x)));
  }
}