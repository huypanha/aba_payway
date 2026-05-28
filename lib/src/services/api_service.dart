import 'package:aba_payway/src/utils/enums.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(headers: {'Content-Type': 'application/json'}, validateStatus: (s) => true));
  String privateKey;
  ABAPaywayEnvironmentEnum env;

  String get _baseUrl {
    switch (env) {
      case .production:
        return 'https://merchant.payway.com.kh/';
      default:
        return 'https://sandbox.payway.com.kh/';
    }
  }

  ApiService({required this.privateKey, required this.env});

  Future<Response> get(String path, {Map<String, dynamic>? query, Object? data}) async {
    return await _dio.get("$_baseUrl$path", queryParameters: query, data: data);
  }

  Future<Response> post(String path, {Map<String, dynamic>? query, Object? data}) async {
    return await _dio.post("$_baseUrl$path", queryParameters: query, data: data);
  }

  Future<Response> delete(String path, {Map<String, dynamic>? query, Object? data}) async {
    return await _dio.delete("$_baseUrl$path", queryParameters: query, data: data);
  }

  Future<Response> put(String path, {Map<String, dynamic>? query, Object? data}) async {
    return await _dio.put("$_baseUrl$path", queryParameters: query, data: data);
  }
}
