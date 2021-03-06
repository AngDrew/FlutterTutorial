import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as security;

class NetworkService {
  NetworkService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        headers: <String, dynamic>{
          'Accept': 'application/json',
        },
      ),
    );
    _storage = const security.FlutterSecureStorage();
  }

  late security.FlutterSecureStorage _storage;
  late Dio _dio;

  /// Used to request to the backend. always check the request method before!
  /// because it's default to `requestMethod = 'get'`.
  /// Use `data` and `queryParameter` to pass data
  Future<Response<dynamic>?> request(
    String path, {
    String requestMethod = 'GET',
    dynamic data,
    Map<String, dynamic>? queryParameter,
    String acceptHeader = 'application/json',
  }) async {
    Response<dynamic>? resp;
    _dio.options.headers['Accept'] = acceptHeader;

    try {
      resp = await _dio.request<dynamic>(
        path,
        data: data,
        queryParameters: queryParameter,
        options: Options(
          method: requestMethod,
          contentType: 'multipart/form-data',
          validateStatus: (int? status) => status! < 500,
          followRedirects: false,
          responseType: ResponseType.json,
        ),
      );
    } catch (e) {
      print(e);
    }

    return resp;
  }

  /// set the authentication token with the `getToken()` method
  Future<void> _setNetworkToken() async {
    _dio.options.headers['Authorization'] = 'Bearer ${await getToken()}';
  }

  /// set the token on the secure storage and then also set the authentication
  /// header with the new token
  Future<void> setToken(String? value) async {
    await _storage.write(key: 'token', value: value);
    await _setNetworkToken();
  }

  /// Get the saved token on the device using secure storage
  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<void> clearStorage() async {
    await _storage.deleteAll();
  }

  /// Checking if the device contains any token and also set the network
  /// authentication header to use that token
  Future<bool> _hasToken() async {
    final bool hasToken = (await getToken()) != null;

    if (hasToken) {
      await _setNetworkToken();
    }
    return hasToken;
  }

  /// always run this method everytime through splash screen to ensure that
  /// the token is available on the device or user should re-authenticate
  Future<bool> validateToken() async {
    if (await _hasToken()) {
      final Response<dynamic>? resp = await request('/users');
      final Map<String, dynamic>? respData =
          resp?.data as Map<String, dynamic>?;

      return respData != null;
    }
    return false;
  }
}
