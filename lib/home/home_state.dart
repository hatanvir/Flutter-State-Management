import 'package:riverpod_flutter/photo/photo_screen.dart';
import 'package:riverpod_flutter/post/post_screen.dart';

class HomeState{
  var navScreenList = [
     PostScreen(),
     PhotoScreen()
  ];

  int pos;
  HomeState({this.pos=0});

}