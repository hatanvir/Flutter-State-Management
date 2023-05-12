import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/data/services/photo_service.dart';
import 'package:riverpod_flutter/data/services/post_service.dart';

class RemoteService{
  PhotoService get photoService => PhotoService();
  PostService get postService => PostService();
}
var remoteServiceProvider = Provider((ref) => RemoteService());