import 'package:equatable_demo/src/core/provider.dart';
import 'package:equatable_demo/src/features/user/data/api/user_api.dart';
import 'package:equatable_demo/src/features/user/data/model/user_model.dart';
import 'package:equatable_demo/src/features/user/data/repository/user_repository.dart';
import 'package:equatable_demo/src/features/user/provider/user_state_provider.dart';
import 'package:riverpod/riverpod.dart';

final userApiProvider = Provider<UserApi>((ref) {
  return UserApi(ref.read(dioClientProvider));
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref.read(userApiProvider));
});

final userProvider =
    StateNotifierProvider<UserNotifier, List<UserModel>>((ref) {
  return UserNotifier(ref: ref);
});

final isLoadingProvider = StateProvider<bool>((ref){
  return true;
});
