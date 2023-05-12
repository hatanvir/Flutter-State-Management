import 'package:riverpod_flutter/data/models/post_response.dart';
import 'package:riverpod_flutter/data/services/post_service.dart';

class PostRepository{
  final PostService postService;

  PostRepository(this.postService);

  Future<List<PostResponse>> getPhotos() async{
    return await postService.postData();
  }
}