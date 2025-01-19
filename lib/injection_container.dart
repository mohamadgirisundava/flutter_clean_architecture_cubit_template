import 'package:flutter_clean_architecture_cubit_template/core/apis/api.dart';
import 'package:flutter_clean_architecture_cubit_template/core/apis/external_api.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/data/datasources/user_local_data_source.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/data/datasources/user_remote_data_source.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/data/repositories/auth_repository_impl.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/data/repositories/user_repository_impl.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/domain/usecases/get_token_usecase.dart';
import 'package:get_it/get_it.dart';

final myDI = GetIt.instance;

Future<void> injectionInit() async {
  myDI.registerSingleton<Api>(Api());
  myDI.registerSingleton<ExternalApi>(ExternalApi());

  //* Data Sources
  myDI.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(myDI()));
  myDI.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl());

  //* Repositories
  myDI.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(myDI(), myDI()));
  myDI.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(myDI(), myDI()));

  //* Use Cases
  myDI.registerLazySingleton(() => GetToken(myDI()));
}
