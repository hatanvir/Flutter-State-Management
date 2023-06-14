import 'package:bloc/bloc.dart';
import 'package:riverpod_flutter/data/repository/post_repository.dart';
import 'package:riverpod_flutter/di/service_locator.dart';
import 'package:riverpod_flutter/module/post/post_event.dart';
import 'package:riverpod_flutter/module/post/post_state.dart';

class PostBloc extends Bloc<PostEvent,PostState>{
  PostRepository postRepository = serviceLocator.get<PostRepository>();

  PostBloc() : super(PostStateInitial()){
    on<GetPostEvent>((event, emit) async{
      try{
        emit(LoadingState());
        var postList = await postRepository.getData();
        emit(LoadedPostState(postList));
      }catch(e){
        emit(ErrorState(e.toString()));
      }
    });
  }

}