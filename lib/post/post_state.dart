import 'package:riverpod_flutter/data/models/post_response.dart';

abstract class PostState {}

class PostStateInitial extends PostState {}

class LoadingState extends PostState {}

class ErrorState extends PostState {
  final msg;

  ErrorState(this.msg);
}

class LoadedPostState extends PostState {
  List<PostResponse> postList;

  LoadedPostState(this.postList);
}