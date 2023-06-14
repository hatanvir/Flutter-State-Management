import 'package:riverpod_flutter/data/repository/base_repository.dart';
import 'package:riverpod_flutter/data/services/photo_service.dart';

class PhotoRepository extends BaseRepository{
  PhotoService photoService = PhotoService();

  @override
  Future getData() async{
    return await photoService.getData();
  }
}