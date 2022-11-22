import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_cache_network/services/services.dart';

import '../models/user_model.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
