import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/data/repository/photo_repository.dart';
import 'package:riverpod_flutter/data/repository/post_repository.dart';
import 'package:riverpod_flutter/data/services/service_provider.dart';

class RepositoryProvider{
  final RemoteService remoteService;

  RepositoryProvider(this.remoteService);

  PhotoRepository get photoRepository => PhotoRepository(remoteService.photoService);
  PostRepository get postRepository => PostRepository(remoteService.postService);
}

var repositoryProvider = Provider((ref){
  RemoteService remoteService = ref.read(remoteServiceProvider);
  return RepositoryProvider(remoteService);
});