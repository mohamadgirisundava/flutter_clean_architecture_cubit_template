import 'dart:io';

import 'package:dio/dio.dart';

abstract class BaseApi {
  late String baseUrl;
  late Map<String, String> headers;

  Future<ApiResponse> get(
    String path, {
    Map<String, String>? queryParameters,
    Options? options,
  });

  Future<ApiResponse> post(
    String path, {
    ApiFormData? formData,
    Map<String, String>? queryParameters,
    Map<String, String>? formObject,
    Options? options,
  });

  Future<ApiResponse> put(
    String path, {
    ApiFormData? formData,
    Map<String, String>? queryParameters,
    Map<String, String>? formObject,
    Options? options,
  });

  Future<ApiResponse> delete(
    String path, {
    ApiFormData? formData,
    Map<String, String>? queryParameters,
    Map<String, String>? formObject,
    Options? options,
  });

  void setToken(String token);

  void clearToken();
}

abstract class ApiResponse {
  int? get statusCode;
  dynamic data;
  dynamic headers;
}

abstract class ApiFormData {
  void addField(String key, String value);
  void addFile(String key, File file, {String? fileName});
  dynamic getBody();
}
