import 'package:flutter_clean_architecture_cubit_template/core/apis/api.dart';
import 'package:flutter_clean_architecture_cubit_template/core/apis/base_api.dart';

abstract class UserRemoteDataSource {
  setToken(String token);

  Future<ApiResponse> getProfile();

  Future<ApiResponse> logout(String deviceId);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Api _api;

  UserRemoteDataSourceImpl(this._api);

  @override
  setToken(String token) async {
    _api.setToken(token);
  }

  @override
  Future<ApiResponse> getProfile() async {
    return await _api.get('account/profile');
  }

  @override
  Future<ApiResponse> logout(String deviceId) async {
    var formData = {'device_id': deviceId};
    return await _api.post('auth/logout', formObject: formData);
  }
}
