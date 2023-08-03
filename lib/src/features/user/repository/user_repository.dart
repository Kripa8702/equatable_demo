import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable_demo/src/constants/endpoints.dart';
import 'package:equatable_demo/src/utils/api_client.dart';
import 'package:equatable_demo/src/features/user/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider =
    Provider((ref) => UserRepository(client: ref.read(apiClientProvider)));

class UserRepository {
  UserRepository({
    required ApiClient client,
  }) : _client = client;

  final ApiClient _client;

  Future<List<UserModel>> fetchUserList() async {
    final res = await _client.getRequest(Endpoints.userUrl);
    final userModelList =
        (res['results'] as List).map((e) => UserModel.fromJson(e)).toList();
    return userModelList;
  }
}
