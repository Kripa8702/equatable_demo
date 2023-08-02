import 'package:dio/dio.dart';
import 'package:equatable_demo/src/core/network/dio_client.dart';
import 'package:riverpod/riverpod.dart';

final dioInstanceProvider = Provider<Dio>((ref){
  return Dio();
});

final dioClientProvider = Provider<DioClient>((ref){
  final _dio = ref.watch(dioInstanceProvider);
  return DioClient(_dio);
});