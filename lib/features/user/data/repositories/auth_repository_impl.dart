import 'package:flutter_clean_architecture_cubit_template/core/errors/api_exception.dart';
import 'package:flutter_clean_architecture_cubit_template/core/errors/failure.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/domain/entities/logout_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/user_local_data_source.dart';
import '../datasources/user_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserLocalDataSource _userLocalDataSource;
  final UserRemoteDataSource _userRemoteDataSource;

  AuthRepositoryImpl(this._userLocalDataSource, this._userRemoteDataSource);

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      var token = await _userLocalDataSource.getToken();
      _userRemoteDataSource.setToken(token ?? '');
      if (token?.isNotEmpty ?? false) {
        return Right(token);
      } else {
        throw const ApiException(401, "Unauthorized");
      }
    } catch (e) {
      if (e is ApiException) {
        return Left(Failure(networkCatchErrorMessage(e), code: e.code));
      } else {
        return Left(Failure(networkCatchErrorMessage(e)));
      }
    }
  }

  @override
  Future<Either<Failure, String?>> clearSession() async {
    try {
      await _userLocalDataSource.clearSession();
      return const Right('Success');
    } catch (e) {
      return Left(Failure(networkCatchErrorMessage(e)));
    }
  }

  @override
  Future<Either<Failure, LogoutModel?>> logout({
    required String deviceId,
  }) async {
    try {
      var res = await _userRemoteDataSource.logout(deviceId);
      var model = LogoutModel.fromJson(
        res.data,
      );
      if (model.status == 'SUCCESS') {
        return Right(model);
      } else {
        throw ApiException((model.statusCode ?? 0).toInt(), model.message);
      }
    } catch (e) {
      if (e is ApiException) {
        return Left(Failure(networkCatchErrorMessage(e), code: e.code));
      } else {
        return Left(Failure(networkCatchErrorMessage(e)));
      }
    }
  }
}
