import 'package:riverpod_flutter/module/photo/photo_screen.dart';
import 'package:riverpod_flutter/module/post/post_screen.dart';

class HomeState{
  var navScreenList = [
     PostScreen(),
     PhotoScreen()
  ];

  int pos;
  HomeState({this.pos=0});

}