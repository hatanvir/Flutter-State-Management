import 'package:riverpod_flutter/data/models/photo_response.dart';
import 'package:riverpod_flutter/data/services/photo_service.dart';

class PhotoRepository{
  final PhotoService photoService;

  PhotoRepository(this.photoService);

  Future<List<PhotoResponse>> getPhotos() async{
    return await photoService.photoData();
  }
}