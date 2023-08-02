import 'package:equatable_demo/src/core/network/constants/endpoints.dart';
import 'package:equatable_demo/src/core/network/dio_client.dart';

class UserApi {
  final DioClient _dioClient;

  UserApi(this._dioClient);

  Future<Map<String, dynamic>> fetchUserApiRequest() async {
    try {
      final res = await _dioClient.get(Endpoints.userUrl);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
