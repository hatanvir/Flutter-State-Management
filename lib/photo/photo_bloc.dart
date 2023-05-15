import 'package:bloc/bloc.dart';
import 'package:riverpod_flutter/data/repository/photo_repository.dart';
import 'package:riverpod_flutter/di/service_locator.dart';
import 'package:riverpod_flutter/photo/photo_event.dart';
import 'package:riverpod_flutter/photo/photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent,PhotoState> {
  PhotoRepository photoRepository = serviceLocator.get<PhotoRepository>();

  PhotoBloc() : super(PhotoInitial()){
    on<GetPhotoEvent>((event, emit) async{
      try {
        emit(LoadingState());
        final photos = await photoRepository.getPhoto();
        emit(PhotoLoadedState(photos));
      }catch(e){
        emit(ErrorState(e.toString()));
      }
    });
  }
}