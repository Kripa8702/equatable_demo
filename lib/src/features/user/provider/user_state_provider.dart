import 'package:equatable_demo/src/features/user/data/model/user_model.dart';
import 'package:equatable_demo/src/features/user/provider/user_provider.dart';
import 'package:riverpod/riverpod.dart';

class UserNotifier extends StateNotifier<List<UserModel>>{
  final Ref ref;

  UserNotifier({required this.ref}) : super([]) {
    fetchUsers(ref: ref);
  }

  Future fetchUsers({required Ref ref}) async{
    await ref
        .read(userRepositoryProvider)
        .fetchUserList()
        .then((value){
          state = value;
          ref.read(isLoadingProvider.notifier).state = false;
    });
  }

}