import 'package:flutter_clean_architecture_cubit_template/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

final class GetToken extends UseCase<String?, NoParams> {
  final AuthRepository _repo;

  GetToken(this._repo);

  @override
  Future<Either<Failure, String?>> call(NoParams params) => _repo.getToken();
}
