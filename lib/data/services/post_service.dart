import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_flutter/data/models/post_response.dart';
import 'package:riverpod_flutter/data/services/base_service.dart';

class PostService extends BaseService{

  @override
  Future getData() async{
    var res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    return await compute(deserializePostResponse,res.body);
  }

  List<PostResponse> deserializePostResponse(String data) {
    return List<PostResponse>.from(json.decode(data).map((x) => PostResponse.fromJson(x)));
  }

}