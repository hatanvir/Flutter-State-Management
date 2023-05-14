import 'package:riverpod_flutter/data/models/photo_response.dart';
import 'package:riverpod_flutter/data/services/photo_service.dart';

class PhotoRepository {
  PhotoService photoService = PhotoService();

  Future<List<PhotoResponse>> getPhoto() async{
    return await photoService.photoData();
  }
}