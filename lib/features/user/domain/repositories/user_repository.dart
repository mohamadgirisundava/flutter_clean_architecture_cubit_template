import 'package:flutter_clean_architecture_cubit_template/core/errors/failure.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/domain/entities/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel?>> getProfile();

  Future<Either<Failure, UserModel?>> loadProfile();
}
