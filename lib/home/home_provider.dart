
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_flutter/post/post_screen.dart';
import '../photo/photo_screen.dart';



var navScreenList = [
  const PostScreen(),
  const PhotoScreen()
];

final stringProvider = Provider((ref)=>'Hello Provider!');

final counterProvider = StateProvider((ref) => 0);

final selectedNavigationProvider = StateProvider((ref) => 0);
