import 'package:flutter_clean_architecture_cubit_template/core/errors/api_exception.dart';
import 'package:flutter_clean_architecture_cubit_template/core/errors/failure.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/data/datasources/user_local_data_source.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/data/datasources/user_remote_data_source.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/domain/entities/user_model.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _userLocalDataSource;
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl(this._userLocalDataSource, this._userRemoteDataSource);

  @override
  Future<Either<Failure, UserModel?>> getProfile() async {
    try {
      var res = await _userRemoteDataSource.getProfile();
      var model = UserModel.fromJson(
        res.data,
      );
      if (model.statusCode == '0') {
        _userLocalDataSource.setUserData(model);
        return Right(model);
      } else {
        throw ApiException((model.statusCode as int), model.message);
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
  Future<Either<Failure, UserModel?>> loadProfile() async {
    try {
      var userData = await _userLocalDataSource.getUserData();
      if (userData != null) {
        return Right(userData);
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
}
