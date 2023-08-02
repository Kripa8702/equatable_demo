import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable_demo/src/utils/api_client.dart';
import 'package:equatable_demo/src/features/user/controller/user_controller.dart';
import 'package:equatable_demo/src/features/user/model/user_model.dart';

class UserRepository{
  final UserApi userApi;

UserRepository(this.userApi);

Future<List<UserModel>> fetchUserList() async {
  try {
    final res = await userApi.fetchUserApiRequest();
    final userModelList =
    (res['results'] as List).map((e) => UserModel.fromJson(e)).toList();
    return userModelList;
  } on DioException catch (e) {
    final errorMessage = DioExceptions.fromDioError(e);
    log(errorMessage.toString());
    rethrow;
  }
}
}