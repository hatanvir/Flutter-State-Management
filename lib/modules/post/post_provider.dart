
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/repository_provider.dart';

final postListProvider = FutureProvider((ref){
  RepositoryProvider repository = ref.read(repositoryProvider);
  return repository.postRepository.getPhotos();
});