import 'package:riverpod_flutter/data/models/post_response.dart';
import 'package:riverpod_flutter/data/services/post_service.dart';

class PostRepository {
  PostService postService = PostService();

  Future<List<PostResponse>> getPost() async{
    return await postService.postData();
  }
}