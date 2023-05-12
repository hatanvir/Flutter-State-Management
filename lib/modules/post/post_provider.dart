
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/data/services/post_service.dart';

var postService = PostService();

final postListProvider = FutureProvider((ref) => postService.postData());