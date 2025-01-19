import 'dart:io';

import 'package:flutter_clean_architecture_cubit_template/core/apis/api.dart';
import 'package:flutter_clean_architecture_cubit_template/core/apis/base_api.dart';
import 'package:flutter_clean_architecture_cubit_template/core/flavors/flavor_config.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ExternalApi extends BaseApi {
  late Dio dio;
  CancelToken? dioCancelToken;

  ExternalApi() {
    dio = Dio();
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
    dio.options.connectTimeout = const Duration(milliseconds: 60000);
    dio.options.receiveTimeout = const Duration(milliseconds: 60000);
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
  }

  @override
  setToken(String token) {
    dio.options.headers['Authorization'] = "Bearer ";
  }

  @override
  void clearToken() {
    dio.options.headers['Authorization'] = "";
  }

  @override
  Future<ApiResponse> delete(
    String path, {
    ApiFormData? formData,
    Map<String, String>? formObject,
    Map<String, String>? queryParameters,
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
    Map<String, dynamic>? formObject,
    Map<String, String>? queryParameters,
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
    Map<String, String>? formObject,
    Map<String, String>? queryParameters,
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
}
