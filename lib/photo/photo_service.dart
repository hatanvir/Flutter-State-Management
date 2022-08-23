import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_flutter/models/photo_response.dart';

class PhotoService{
  Future<List<PhotoResponse>> photoData() async{
    var res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    return List<PhotoResponse>.from(json.decode(res.body).map((x) => PhotoResponse.fromJson(x)));
  }
}