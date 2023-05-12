
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/data/repository/repository_provider.dart';

final photoListProvider = FutureProvider((ref){
  RepositoryProvider repository = ref.read(repositoryProvider);
  return repository.photoRepository.getPhotos();
});