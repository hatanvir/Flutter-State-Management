import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverpod_flutter/home/home_event.dart';
import 'package:riverpod_flutter/home/home_state.dart';
import 'package:riverpod_flutter/photo/photo_screen.dart';
import 'package:riverpod_flutter/post/post_screen.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState> {
  var navScreenList = [
    const PostScreen(),
    const PhotoScreen()
  ];

  HomeBloc() : super(HomeState()){
    on<NavigationPositionChangeEvent>((event, emit){
      emit(HomeState(pos: event.pos));
    });
  }
}