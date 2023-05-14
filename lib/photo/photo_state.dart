import 'package:riverpod_flutter/data/models/photo_response.dart';

abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class LoadingState extends PhotoState{}

class ErrorState extends PhotoState {
  final String msg;

  ErrorState(this.msg);
}

class PhotoLoadedState extends PhotoState {
  final List<PhotoResponse> photos;

  PhotoLoadedState(this.photos);
}