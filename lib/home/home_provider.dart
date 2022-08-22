
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_flutter/home/home_service.dart';

var homeService = HomeService();

final stringProvider = Provider((ref)=>'Hello Provider!');

final counterProvider = StateProvider((ref) => 0);

final postListProvider = FutureProvider((ref) => homeService.postData());