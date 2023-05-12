
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_flutter/modules/post/post_screen.dart';
import '../photo/photo_screen.dart';

var navScreenList = [
  const PostScreen(),
  const PhotoScreen()
];

final selectedNavigationProvider = StateProvider((ref) => 0);
