import 'package:flutter_clean_architecture_cubit_template/core/errors/errors.dart';
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final ErrorObject? error;
  final int? code;

  const Failure(this.error, {this.code});

  @override
  List<Object?> get props => [error, code];
}
