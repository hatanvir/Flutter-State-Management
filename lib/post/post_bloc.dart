import 'package:bloc/bloc.dart';
import 'package:riverpod_flutter/data/repository/post_repository.dart';
import 'package:riverpod_flutter/post/post_event.dart';
import 'package:riverpod_flutter/post/post_state.dart';

class PostBloc extends Bloc<PostEvent,PostState>{
  PostRepository postRepository = PostRepository();

  PostBloc() : super(PostStateInitial()){
    on<GetPostEvent>((event, emit) async{
      try{
        emit(LoadingState());
        var postList = await postRepository.getPost();
        emit(LoadedPostState(postList));
      }catch(e){
        emit(ErrorState(e.toString()));
      }
    });
  }

}