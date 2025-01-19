import 'package:flutter_clean_architecture_cubit_template/core/errors/failure.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/domain/entities/logout_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, String?>> getToken();

  Future<Either<Failure, String?>> clearSession();

  Future<Either<Failure, LogoutModel?>> logout({
    required String deviceId,
  });
}
