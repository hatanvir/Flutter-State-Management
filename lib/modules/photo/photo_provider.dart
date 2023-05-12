
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/data/services/photo_service.dart';

var photoService = PhotoService();
final photoListProvider = FutureProvider((ref) => photoService.photoData());