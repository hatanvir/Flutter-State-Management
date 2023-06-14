import 'package:riverpod_flutter/data/repository/base_repository.dart';
import 'package:riverpod_flutter/data/services/post_service.dart';

class PostRepository extends BaseRepository{
  PostService postService = PostService();

  @override
  Future getData() async{
    return await postService.getData();
  }
}