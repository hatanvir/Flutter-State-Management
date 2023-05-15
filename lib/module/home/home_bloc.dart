import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverpod_flutter/module/home/home_event.dart';
import 'package:riverpod_flutter/module/home/home_state.dart';
import 'package:riverpod_flutter/module/photo/photo_screen.dart';
import 'package:riverpod_flutter/module/post/post_screen.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState> {
  var navScreenList = [
     PostScreen(),
     PhotoScreen()
  ];

  HomeBloc() : super(HomeState()){
    on<NavigationPositionChangeEvent>((event, emit){
      emit(HomeState(pos: event.pos));
    });
  }
}