import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;

class UnAuthorizedException implements Exception {
  final String message;

  UnAuthorizedException(this.message);
}

final httpClientProvider = Provider((ref) => http.Client());

final apiClientProvider =
    Provider((ref) => ApiClient(client: ref.read(httpClientProvider)));

class ApiClient {
  final http.Client _client;

  const ApiClient({
    required http.Client client,
  }) : _client = client;

  //Headers ---------------------------

  Map<String, String> get _headers {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return headers;
  }

  //GET request -----------------------

  Future getRequest(String url) async {
    try {
      _print(url);
      _print(_headers);
      final response = await _client.get(
        Uri.parse(url),
        headers: _headers,
      );

      if (response.statusCode == 401) {
        throw UnAuthorizedException(
            response.reasonPhrase ?? 'Failed to authenticate.');
      }

      if (response.statusCode == 200) {
        _print(response.body);
        return jsonDecode(response.body);
      }
      throw Exception(response.reasonPhrase);
    } on SocketException catch (_) {
      throw 'No Internet Connection.';
    } catch (e) {
      rethrow;
    }
  }

  //POST request -----------------------

  Future<Map<String, dynamic>> postRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      _print(url);
      _print(body);
      _print(_headers);
      final response = await _client.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: _headers,
      );

      if (response.statusCode == 401) {
        throw UnAuthorizedException(
            response.reasonPhrase ?? 'Failed to authenticate.');
      }

      if (response.statusCode == 201 ||
          response.statusCode == 201 ||
          response.statusCode == 400 ||
          response.statusCode == 403) {
        _print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        _print(response.reasonPhrase);
        throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      throw 'No Internet Connection.';
    }
  }

  //PUT request -----------------------

  Future<bool> putRequest({
    required String uploadUrl,
    required File file,
    required String contentType,
  }) async {
    try {
      final response = await http.put(
        Uri.parse(uploadUrl),
        body: file.readAsBytesSync(),
        headers: {
          'Content-Type': contentType,
        },
      );

      if (response.statusCode == 401) {
        throw UnAuthorizedException(
            response.reasonPhrase ?? 'Failed to authenticate.');
      }

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      throw 'No Internet Connection.';
    } catch (e) {
      rethrow;
    }
  }

  //PATCH request -----------------------

  Future<Map<String, dynamic>> patchRequest({
    required String url,
    Map<String, dynamic> body = const {},
  }) async {
    try {
      _print(url);
      _print(body);
      _print(_headers);
      final response = await _client.patch(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: _headers,
      );

      if (response.statusCode == 401) {
        throw UnAuthorizedException(
            response.reasonPhrase ?? 'Failed to authenticate.');
      }

      if (response.statusCode == 201 ||
          response.statusCode == 200 ||
          response.statusCode == 400 ||
          response.statusCode == 403) {
        _print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        _print(response.reasonPhrase);
        throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      throw 'No Internet Connection.';
    }
  }

  //DELETE request -----------------------
  Future<dynamic> deleteRequest(String url) async {
    try {
      _print(url);
      _print(_headers);
      final response = await _client.delete(
        Uri.parse(url),
        headers: _headers,
      );
      if (response.statusCode == 401) {
        throw UnAuthorizedException(
            response.reasonPhrase ?? 'Failed to authenticate.');
      }
      if (response.statusCode == 200) {
        _print(response.body);
        return jsonDecode(response.body);
      }
      throw Exception(response.reasonPhrase);
    } on SocketException catch (_) {
      throw 'No Internet Connection.';
    } catch (e) {
      rethrow;
    }
  }






  _print(dynamic text) {
    if (kDebugMode) {
      debugPrint(text.toString());
    }
  }

}
