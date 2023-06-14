import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_flutter/data/models/photo_response.dart';
import 'package:riverpod_flutter/data/services/base_service.dart';

class PhotoService extends BaseService{

  @override
  Future getData() async{
    var res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    return await compute(deserializePhotoResponse,res.body);
  }

  List<PhotoResponse> deserializePhotoResponse(String data) {
    return List<PhotoResponse>.from(json.decode(data).map((x) => PhotoResponse.fromJson(x)));
  }

}