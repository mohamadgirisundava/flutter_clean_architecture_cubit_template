import 'dart:io';

import 'package:flutter_clean_architecture_cubit_template/core/apis/base_api.dart';
import 'package:flutter_clean_architecture_cubit_template/core/flavors/flavor_config.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class Api extends BaseApi {
  late Dio dio;
  CancelToken? dioCancelToken;

  Api() {
    dio = Dio();
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate certificate, String host, int port) => true;
        return client;
      },
    );
    dio.options.connectTimeout = const Duration(microseconds: 60000);
    dio.options.receiveTimeout = const Duration(microseconds: 60000);
    dioCancelToken = CancelToken();
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        request: true,
        requestBody: true,
      ),
    );
    baseUrl = FlavorConfig.instance?.flavorValues.baseUrl ?? '';
    dio.options.headers['Language'] = "EN";
    dio.options.headers['Content-Type'] = "application/json";
    dio.options.headers['order-from'] = "mobile";
  }

  @override
  Future<ApiResponse> delete(
    String path, {
    ApiFormData? formData,
    Map<String, String>? queryParameters,
    Map<String, String>? formObject,
    Options? options,
  }) async {
    final response = await dio.delete(
      path,
      data: formData != null ? formData.getBody() : formObject,
      queryParameters: queryParameters,
      options: options,
    );
    return DioApiResponse(response);
  }

  @override
  Future<ApiResponse> get(
    String path, {
    Map<String, String>? queryParameters,
    Options? options,
  }) async {
    final response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
    return DioApiResponse(response);
  }

  @override
  Future<ApiResponse> post(
    String path, {
    ApiFormData? formData,
    Map<String, String>? queryParameters,
    Map<String, String>? formObject,
    Options? options,
  }) async {
    final response = await dio.post(
      path,
      data: formData != null ? formData.getBody() : formObject,
      queryParameters: queryParameters,
      options: options,
    );
    return DioApiResponse(response);
  }

  @override
  Future<ApiResponse> put(
    String path, {
    ApiFormData? formData,
    Map<String, String>? queryParameters,
    Map<String, String>? formObject,
    Options? options,
  }) async {
    final response = await dio.put(
      path,
      data: formData != null ? formData.getBody() : formObject,
      queryParameters: queryParameters,
      options: options,
    );
    return DioApiResponse(response);
  }

  @override
  void setToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  @override
  void clearToken() {
    dio.options.headers['Authorization'] = '';
  }
}

class DioApiResponse extends ApiResponse {
  final Response response;

  DioApiResponse(this.response);
  @override
  get data => response.data;

  @override
  get headers => response.headers;

  @override
  int? get statusCode => response.statusCode;
}
