// import 'package:equatable_demo/src/utils/api_client.dart';
// import 'package:equatable_demo/src/features/user/controller/user_controller.dart';
// import 'package:equatable_demo/src/features/user/model/user_model.dart';
// import 'package:equatable_demo/src/features/user/provider/user_state_provider.dart';
// import 'package:equatable_demo/src/features/user/repository/user_repository.dart';
// import 'package:riverpod/riverpod.dart';
//
// final userApiProvider = Provider<UserApi>((ref) {
//   return UserApi(ref.read(dioClientProvider));
// });
//
// final userRepositoryProvider = Provider<UserRepository>((ref) {
//   return UserRepository(ref.read(userApiProvider));
// });
//
// final userProvider =
//     StateNotifierProvider<UserNotifier, List<UserModel>>((ref) {
//   return UserNotifier(ref: ref);
// });
//
// final isLoadingProvider = StateProvider<bool>((ref){
//   return true;
// });
