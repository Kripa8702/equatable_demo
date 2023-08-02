import 'package:equatable_demo/src/constants/endpoints.dart';
import 'package:equatable_demo/src/utils/api_client.dart';

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
