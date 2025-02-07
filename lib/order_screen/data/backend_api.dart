import 'dart:developer';

import 'package:dio/dio.dart';

enum HttpMethod { get, post, put, delete }

class BackendApi {
  final Dio _http;

  BackendApi() : _http = Dio();

  Future<Response> _getResponse({
    required String endpoint,
    required HttpMethod method,
    Object? data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    late Response response;
    try {
      switch (method) {
        case HttpMethod.get:
          response = await _http.get(endpoint,
              options: options, queryParameters: queryParameters);
        case HttpMethod.post:
          response = await _http.post(endpoint,
              data: data, options: options, queryParameters: queryParameters);
        case HttpMethod.put:
          response = await _http.put(endpoint,
              data: data, options: options, queryParameters: queryParameters);
        case HttpMethod.delete:
          response = await _http.delete(endpoint,
              data: data, options: options, queryParameters: queryParameters);
        default:
          throw UnsupportedError('Unsupported HTTP method');
      }
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
    return response;
  }

  bool _isSuccess(Response response) {
    return response.statusCode != null && response.statusCode! >= 200;
  }

  Future<List<dynamic>?> getPromotionalItems() async {
    final response = await _getResponse(
        endpoint: 'https://api.menu.crvn.kz/api/v1/menu/active/1',
        method: HttpMethod.get,
        queryParameters: {'limit': 20});

    if (_isSuccess(response)) {
      return (response.data as Map<String, dynamic>)['products']
          as List<dynamic>;
    } else {
      return null;
    }
  }

  void _handleError(DioException e) {
    log('Error:  ${e.message}', name: 'Backend API');
  }
}
