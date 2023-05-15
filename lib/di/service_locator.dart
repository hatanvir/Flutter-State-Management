import 'package:get_it/get_it.dart';
import 'package:riverpod_flutter/data/repository/photo_repository.dart';
import 'package:riverpod_flutter/data/repository/post_repository.dart';
import 'package:riverpod_flutter/data/services/photo_service.dart';
import 'package:riverpod_flutter/data/services/post_service.dart';
import 'package:riverpod_flutter/home/home_bloc.dart';
import 'package:riverpod_flutter/photo/photo_bloc.dart';
import 'package:riverpod_flutter/post/post_bloc.dart';

var serviceLocator = GetIt.instance;

void setup() {
  ///bloc locator
  serviceLocator.registerFactory(()=>HomeBloc());
  serviceLocator.registerFactory(()=>PostBloc());
  serviceLocator.registerFactory(()=>PhotoBloc());

  ///repository locator
  serviceLocator.registerLazySingleton(() => PostRepository());
  serviceLocator.registerLazySingleton(() => PhotoRepository());

  ///service locator
  serviceLocator.registerLazySingleton(() => PostService());
  serviceLocator.registerLazySingleton(() => PhotoService());

}