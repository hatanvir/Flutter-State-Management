import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/photo_response.dart';

class PhotoService{
  Future<List<PhotoResponse>> photoData() async{
    var res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    return await compute(deserializePhotoResponse,res.body);
  }

  List<PhotoResponse> deserializePhotoResponse(String data) {
    return List<PhotoResponse>.from(json.decode(data).map((x) => PhotoResponse.fromJson(x)));
  }
}